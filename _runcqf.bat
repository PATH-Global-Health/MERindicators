@ECHO OFF
setlocal enabledelayedexpansion

REM Run sep cleanup script
call _runcleanup.bat

REM Run sushi
call sushi .

REM Move vocabulary, libraries to the right place
mkdir input\vocabulary\codesystem
mkdir input\vocabulary\valueset
mkdir input\resources\library
copy fsh-generated\resources\CodeSystem-* input\vocabulary\codesystem\
copy fsh-generated\resources\ValueSet-* input\vocabulary\valueset\
copy fsh-generated\resources\Library-* input\resources\library\

REM Run cql tooling
call _refresh.bat

REM Run publisher without sushi
call _genonce.bat -no-sushi 

echo "Exit code: %errorlevel%"

ENDLOCAL
