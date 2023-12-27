@ECHO OFF

echo.
echo.
echo -------------- Build Unity Project --------------
echo.

@REM build step
call .\ci\windows\local-build ^
  "D:\Unity\Unity Hub\Editor\2021.3.24f1\Editor\Unity.exe" ^
  "D:\MingProgram\unity-learning\proenv\Coin-Pusher-Dannis" ^
  %1 ^
  "D:\\MingProgram\\unity-learning\\build\\Coin Pusher" ^
  "D:\\MingProgram\\unity-learning\\build\\Coin Pusher\\Coin Pusher" ^
  "awscc124@wanin.tw" ^
  "Wanin@124" ^
  "SC-9YZC-GK5A-88Y7-2ZXR-JFK2" ^
  .\temp ^


@REM compress step
call .\ci\windows\zip %1 "D:\\MingProgram\\unity-learning\\build"
