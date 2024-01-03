@ECHO OFF

setlocal enabledelayedexpansion

@REM volumn directory set
@REM windows: C:\app\temp
@REM ubuntu: /app/temp
set BUILD_TEMP_DIRECTORY=/app/temp

@REM docker image set
set IMAGE_NAME=custom-unity-editor
set DOCKERFILE_NAME_PATH_WINDOWS=%CD%\dockerfile.build.windows
set DOCKERFILE_NAME_PATH_UBUNTU=%CD%\dockerfile.build.ubuntu

@REM unity editor set
set UNITY_VERSION=2021.3.24f1
set UNITY_OS_VERSION=ubuntu
set UNITY_BUILD_TARGET=linux
set UNITY_BUILD_TYPE=il2cpp
set UNITY_IMAGE_VERSION=3
set UNITY_USERNAME=awscc124@wanin.tw
set UNITY_PASSWORD=Wanin@124
set UNITY_SERIALKEY=SC-9YZC-GK5A-88Y7-2ZXR-JFK2

@REM Project set
set BUILD_TARGET=Linux64


@REM widnows: C:\app\Coin-Pusher-Dannis
@REM ubuntu: /app/Coin-Pusher-Dannis
set BUILD_PROJECT_PATH=/app/Coin-Pusher-Dannis

@REM widnows: C:\\app\\build
@REM ubuntu: /app/build
set BUILD_TARGET_PATH=/app/build


if %1==build (
  if %UNITY_OS_VERSION%==windows (
    set dockerfile=%DOCKERFILE_NAME_PATH_WINDOWS%
  ) else if %UNITY_OS_VERSION%==ubuntu (
    set dockerfile=%DOCKERFILE_NAME_PATH_UBUNTU%
  )


  if EXIST "!dockerfile!" (
    echo.
    echo.
    echo ### Docker build info ###
    echo.
    echo Dockerfile path:   !dockerfile!
    echo Docker image name: %IMAGE_NAME%

    docker build ^
    -f !dockerfile! ^
    -t %IMAGE_NAME% ^
    --build-arg UNITY_VERSION=%UNITY_VERSION% ^
    --build-arg UNITY_OS_VERSION=%UNITY_OS_VERSION% ^
    --build-arg UNITY_IMAGE_VERSION=%UNITY_IMAGE_VERSION% ^
    --build-arg UNITY_BUILD_TARGET=%UNITY_BUILD_TARGET% ^
    --build-arg UNITY_BUILD_TYPE=%UNITY_BUILD_TYPE% .
  ) else (
    echo.
    echo Dockerfile file could not be found at !dockerfile!
  )
) else if %1==run (

  if %UNITY_OS_VERSION%==windows (
    set volumn_buildpath="%CD%/build:C:\app\build"
    set volumn_temppath="%CD%/temp:C:\app\temp"
  ) else if %UNITY_OS_VERSION%==ubuntu (
    set volumn_buildpath="%CD%/build:/app/build"
    set volumn_temppath="%CD%/temp:/app/temp"
  )

  for /f "tokens=1-2" %%a in (containers.txt) do (
    for /f "delims=" %%i in ('docker ps -a ^| grep %%a') do (
      if not %%i=="" (
        docker exec -it %%a script/run-in-docker.sh return
        docker stop %%a
        docker rm %%a
      )
    )
  )

  docker-compose -f docker-compose.yml up -d 


  docker ps | grep %IMAGE_NAME% | awk '{print $1}' > containers.txt

  @REM docker run -v !volumn_buildpath! ^
  @REM   -v !volumn_temppath! ^
  @REM   -e UNITY_VERSION=%UNITY_VERSION% ^
  @REM   -e UNITY_USERNAME=%UNITY_USERNAME% ^
  @REM   -e UNITY_PASSWORD=%UNITY_PASSWORD% ^
  @REM   -e UNITY_SERIALKEY=%UNITY_SERIALKEY% ^
  @REM   -e BUILD_TARGET=%BUILD_TARGET% ^
  @REM   -e BUILD_PROJECT_PATH=%BUILD_PROJECT_PATH% ^
  @REM   -e "BUILD_TARGET_PATH=%BUILD_TARGET_PATH%" ^
  @REM   -e BUILD_TEMP_DIRECTORY=%BUILD_TEMP_DIRECTORY% ^
  @REM   -it --rm %IMAGE_NAME%:latest
) else if %1==exec ( @REM These is used by loacl test
  if "%2"=="" (
    exit /b 1
  ) else (
    echo Command: %2

    for /f "tokens=1-2" %%a in (containers.txt) do (
      set container=%%a
    )

    if "%2"=="ls" (
      docker exec -e test1=testtest !container! temp/test.sh
    ) else if "%2"=="active" (
      docker exec -it !container! script/run-in-docker.sh active
    ) else if "%2"=="return" (
      docker exec -it !container! script/run-in-docker.sh return
    )
  )
) else if %1==stop ( 
  for /f "tokens=1-2" %%a in (containers.txt) do (
    docker stop %%a

    docker rm %%a
  )
)
