@ECHO OFF
echo.
echo ########## Get Activation-File Step ##########
echo.
echo 1. Activate user name: %2
echo 2. Activate password: %3
echo 3. Activate serial: %4
echo 4. Activate project path: %6

%1 -batchmode -quit -nographics -username %2 -password %3 -serial %4 -logFile %5\get-activation-file-0.log -projectpath %6

echo.
set EXIT_CODE=%ERRORLEVEL%

echo.
echo Unity project finished to get activation file, exitcode: %EXIT_CODE%
if %EXIT_CODE%==0 (
  echo Successfully, get license.
) else (
  echo There is something error happen, please go to see log file in temp directory .
)
