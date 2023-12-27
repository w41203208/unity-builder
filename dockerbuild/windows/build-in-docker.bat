@ECHO OFF


echo.
echo.
echo -------------- Build Unity Project --------------
echo.

@REM Activate license Step
call %~dp0ci\windows\get-activation-file.bat ^
  "C:\UnityEditor\%UNITY_VERSION%\Editor\Unity.exe" ^
  "%UNITY_USERNAME%" ^
  "%UNITY_PASSWORD%" ^
  "%UNITY_SERIALKEY%" ^
  %BUILD_TEMP_DIRECTORY% ^
  "%BUILD_PROJECT_PATH%" 


@REM Build Step
call %~dp0ci\windows\build.bat ^
  "C:\UnityEditor\%UNITY_VERSION%\Editor\Unity.exe" ^
  "%BUILD_PROJECT_PATH%" ^
  %BUILD_TARGET% ^
  "%BUILD_TARGET_PATH%\\Coin Pusher" ^
  "%BUILD_TARGET_PATH%\\Coin Pusher\\Coin Pusher" ^
  %BUILD_TEMP_DIRECTORY% 

set EXIT_CODE=%ERRORLEVEL%

@REM Compress Step
call %~dp0ci\windows\zip %BUILD_TARGET% "%BUILD_TARGET_PATH%"

@REM Return license Step
call %~dp0ci\windows\return-activation-file.bat ^
  "C:\UnityEditor\%UNITY_VERSION%\Editor\Unity.exe" ^
  "%UNITY_USERNAME%" ^
  "%UNITY_PASSWORD%" ^
  %BUILD_TEMP_DIRECTORY% ^
