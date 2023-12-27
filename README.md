## Unity Project CI/CD Step

1. push to github / gitlab / ...

2. jenkins detect has new branch


3. notice clone new version in docker container

    3.1 go in Coin Pusher directory

4. 



### Docker build 

```
docker-cmd build
```
 
### Docker Run

```
docker-cmd run
```



### build.bat args

1. unity path #D:\Unity\Unity Hub\Editor\2021.3.24f1\Editor\Unity.exe

2. project path #D:\MingProgram\unity-learning\proenv\Coin-Pusher-Dannis

3. build target: Linux64、Win64

4. windows dir #D:\\MingProgram\\unity-learning\\build\\Coin Pusher

5. windows destination path #D:\\MingProgram\\unity-learning\\build\\Coin Pusher\\Coin Pusher

#### Demo 

```
build "C:\UnityEditor\2021.3.24f1\EditorUnity.exe" "C:\app\Coin-Pusher-Dannis" Win64 "C:\\app\\build\\Coin Pusher" "C:\\app\\build\\Coin Pusher\\Coin Pusher"
```



#### test

- get .alf

    ```
    "C:\UnityEditor\2021.3.24f1\Editor\Unity.exe" -batchmode -createManualActivationFile -nographics -username w41203208.work@gmail.com -password Jay41203208*joyce -logFile .\build\myLog.txt
    ```

- manual 

    - https://license.unity3d.com/manual


- activate license

    - manual

        ```
        "C:\UnityEditor\2021.3.24f1\Editor\Unity.exe" -batchmode -quit -logFile .\build\myLog.txt -stackTraceLogType Full -username w41203208.work@gmail.com -password Jay41203208*joyce -manualLicenseFile ".\test\Unity_lic.ulf" 
        ```
    - auto
        ```
        "D:\Unity\Unity Hub\Editor\2021.3.24f1\Editor\Unity.exe" -batchmode -username awscc124@wanin.tw  -password Wanin@124 -serial SC-9YZC-GK5A-88Y7-2ZXR-JFK2 -quit -logFile .\test\get-activation-file-0.log -projectpath D:\MingProgram\unity-learning\proenv\Coin-Pusher-Dannis
        ```

- return license

  ```
  "C:\UnityEditor\2021.3.24f1\Editor\Unity.exe" -quit -batchmode -returnlicense -username w41203208.work@gmail.com -password Jay41203208*joyce
  ```

- init project 

    ```
    "C:\UnityEditor\2021.3.24f1\Editor\Unity.exe" -logFile ..\test\log-1.txt -batchmode -quit -nographics -username w41203208.work@gmail.com -password Jay41203208*joyce
    ```

- build project

    ```
    "C:\UnityEditor\2021.3.24f1\Editor\Unity.exe" -batchmode -quit -nographics -projectPath "C:\app" -logFile .\build\myLog.txt -stackTraceLogType Full -username w41203208.work@gmail.com -password Jay41203208*joyce -manualLicenseFile ".\test\Unity_v2021.x.ulf" -buildTarget "Win64" -executeMethod BuildTool.Build -destinationPath "C:\\app\\build\\Coin Pusher\\Coin Pusher"
    ```

### Demo

https://gitlab.com/game-ci/unity3d-gitlab-ci-example