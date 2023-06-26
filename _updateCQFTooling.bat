@ECHO OFF
setlocal enabledelayedexpansion

set "r=releases"
set "g=org.opencds.cqf"
set "a=tooling-cli"
set "v=2.4.0"

set "dlurl=https://oss.sonatype.org/service/local/artifact/maven/redirect?r=%r%&g=%g%&a=%a%&v=%v%"
set "dlurl_escaped=%dlurl:&=^^^&%"

echo %dlurl_escaped%
SET "tooling_jar=tooling-cli-2.4.0.jar"
SET "input_cache_path=%~dp0input-cache\"
SET "skipPrompts=false"
IF "%~1"=="/f" SET "skipPrompts=true"

FOR %%x IN ("%CD%") DO SET "upper_path=%%~dpx"

IF NOT EXIST "!input_cache_path!!tooling_jar!" (
   IF NOT EXIST "!upper_path!!tooling_jar!" (
      SET "jarlocation=!input_cache_path!!tooling_jar!"
      SET "jarlocationname=Input Cache"
      ECHO IG Refresh is not yet in input-cache or parent folder.
      REM we don't use jarlocation below because it will be empty because we're in a bracketed if statement
      GOTO create
   ) ELSE (
      ECHO IG Refresh FOUND in parent folder
      SET "jarlocation=!upper_path!!tooling_jar!"
      SET "jarlocationname=Parent folder"
      GOTO upgrade
   )
) ELSE (
   ECHO IG Refresh FOUND in input-cache
   SET "jarlocation=!input_cache_path!!tooling_jar!"
   SET "jarlocationname=Input Cache"
   GOTO upgrade
)

:create
ECHO Will place refresh jar here: !input_cache_path!!tooling_jar!
IF "%skipPrompts%"=="false" (
    SET /p create=Ok? [Y/N]
    IF /I "!create!"=="Y" goto mkdir
) ELSE goto mkdir

GOTO done

:mkdir
ECHO "Creating input cache" 
mkdir "!input_cache_path!" 2> NUL
GOTO download

:upgrade
IF "%skipPrompts%"=="false" (
    SET /p overwrite="Overwrite !jarlocation!? (Y/N)"
    IF /I "!overwrite!"=="Y" (
        GOTO download
    )
) ELSE (
    GOTO download
)
GOTO done

:download
ECHO Downloading most recent refresh to !jarlocationname! - it's ~110 MB, so this may take a bit

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%dlurl%', '!jarlocation!')"
ECHO Download complete.
GOTO done

:done
IF "%skipPrompts%"=="false" (
    PAUSE
)
