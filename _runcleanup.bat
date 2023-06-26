@ECHO OFF
setlocal enabledelayedexpansion

REM Cleanup
rmdir /s /q fsh-generated\resources\
rmdir /s /q input\examples-src\output\
rmdir /s /q input\fsh\bulk\
rmdir /s /q output\
del /f /q input\resources\Library-* input\resources\library-* input\resources\library\*
del /f /q input\vocabulary\codesystem\CodeSystem-*
del /f /q input\vocabulary\valueset\ValueSet-*
echo "Exit code: %errorlevel%"

ENDLOCAL
