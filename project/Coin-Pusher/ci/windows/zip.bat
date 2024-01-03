@ECHO OFF
setlocal enabledelayedexpansion


@REM remove double quote with string
set TempPathString=%2
set TempPathString=%TempPathString:*"=%
set BuildPath=%TempPathString:"=%

set BuildFileDestinationPath="%BuildPath%\\Coin Pusher"
echo.
echo.
echo ########## Compress Step ##########
echo.
echo 1. Compress target: %1
echo 2. Build File DestinationPath: %BuildFileDestinationPath%
if %1==Linux64 (
  set CompressFileDestinationPath=%BuildPath%\\Coin Pusher_linux_version
) else if %1==Win64 (
  set CompressFileDestinationPath=%BuildPath%\\Coin Pusher_windows_version
)
echo 2. Compress File DestinationPath: %CompressFileDestinationPath%


set OriginalPath=%CompressFileDestinationPath%
set Temp=%CompressFileDestinationPath%
set "CompressFileDestinationPath="

:while_loop
for /f "delims=[\\] tokens=1,*" %%a in ("!Temp!") do (
  @REM echo %%a, %%b
  set Temp=%%b

  set "CompressFileDestinationPath=!CompressFileDestinationPath!%%a\"

  echo !Temp! | findstr "\\" >nul

  if !errorlevel! equ 0 (
    goto :while_loop
  ) else (
    set "CompressFileDestinationPath=!CompressFileDestinationPath!%%b"
  )
)

echo.
echo Check zip file
set zipPath=%CompressFileDestinationPath%.zip
echo.
echo zip file path: %zipPath%
if EXIST "%zipPath%" (
  echo Find the same name zip file, delete it.
  del "%zipPath%"
) else (
  echo Couldn't find the smae name zip file.
)

set CompressFileDestinationPath=!OriginalPath!




powershell -ExecutionPolicy Bypass -File "%~dp0zip.ps1" -BuildFileDestinationPath %BuildFileDestinationPath% -CompressFileDestinationPath "%CompressFileDestinationPath%"
set EXIT_CODE=%ERRORLEVEL%
echo.
echo Compress result - existcode: %EXIT_CODE%
if "%EXIT_CODE%"=="0" (
  echo Finish to compress, file is %CompressFileDestinationPath%.zip
) else (
  echo There is something error happend
)