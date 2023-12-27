@ECHO OFF
echo.
echo.
echo ########## Return Activation-File Step ##########
echo.

%1 -quit -nographics -batchmode -username %2 -password %3 -returnlicense -logFile %4\return-license-file-0.log

echo.
set EXIT_CODE=%ERRORLEVEL%

echo.
echo Unity project finished to return activation file, exitcode: %EXIT_CODE%
if %EXIT_CODE%==0 (
  echo Successfully, return license.
) else (
  echo There is something error happen, please go to see log file in temp directory .
)