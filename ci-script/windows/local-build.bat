@ECHO OFF

setlocal enabledelayedexpansion
set UNITY_PATH=%1
set PROJECT_PATH=%2

@REM Input: Win64、Linux64
set BUILD_TARGET="%3"
set DIRECTORY=%4
set DESTINATION_PATH=%5
echo.
echo.
echo ########## Build Step ##########
echo.
echo 1. Build Unity-Editor: %UNITY_PATH%
echo 2. Build target: %BUILD_TARGET%
echo 3. Build project: %PROJECT_PATH%
echo 4. Build destinationPath: %DIRECTORY%
rmdir /s /q %DIRECTORY%
mkdir %DIRECTORY%


%UNITY_PATH% -quit -batchmode -nographics -logFile %9\build-log-0.log -projectPath %PROJECT_PATH% -executeMethod BuildTool.Build -buildTarget %BUILD_TARGET% -destinationPath %DESTINATION_PATH%

echo.
set EXIT_CODE=%ERRORLEVEL%

echo.
echo Unity project finished to build, exitcode: %EXIT_CODE%
if %EXIT_CODE%==0 (
  echo Congratulation, unity project has been builded successfully.
) else (
  echo There is something error happen, please go to see log file in temp directory .
)