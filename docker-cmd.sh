#!/bin/bash

# volumn directory set
# windows: C:\app\temp
# ubuntu: /app/temp
BUILD_TEMP_DIRECTORY="/app/temp"

# docker image set
IMAGE_NAME="custom-unity-editor"
DOCKERFILE_NAME_PATH_WINDOWS="$(pwd)/dockerfile.build.windows"
DOCKERFILE_NAME_PATH_UBUNTU="$(pwd)/dockerfile.build.ubuntu"

# unity editor set
UNITY_VERSION="2021.3.24f1"
UNITY_OS_VERSION="ubuntu"
UNITY_BUILD_TARGET="linux"
UNITY_BUILD_TYPE="il2cpp"
UNITY_IMAGE_VERSION=3
UNITY_USERNAME="awscc124@wanin.tw"
UNITY_PASSWORD="Wanin@124"
UNITY_SERIALKEY="SC-9YZC-GK5A-88Y7-2ZXR-JFK2"

# Project set
BUILD_TARGET="Linux64"

# windows: C:\app\Coin-Pusher-Dannis
# ubuntu: /app/Coin-Pusher-Dannis
BUILD_PROJECT_PATH="/app/Coin-Pusher-Dannis"

# windows: C:\\app\\build
# ubuntu: /app/build
BUILD_TARGET_PATH="/app/build"


if [ "$1" = "build" ]; then
  if [ "$UNITY_OS_VERSION" = "windows" ]; then
    dockerfile="$DOCKERFILE_NAME_PATH_WINDOWS"
  elif [ "$UNITY_OS_VERSION" = "ubuntu" ]; then
    dockerfile="$DOCKERFILE_NAME_PATH_UBUNTU"
  fi

  # build dcoker image
  if [ -e "$dockerfile" ]; then
    echo
    echo
    echo "### Docker build info ###"
    echo
    echo "Dockerfile path:   $dockerfile"
    echo "Docker image name: $IMAGE_NAME"

    sudo docker build \
      -f "$dockerfile" \
      -t "$IMAGE_NAME" \
      --build-arg UNITY_VERSION="$UNITY_VERSION" \
      --build-arg UNITY_OS_VERSION="$UNITY_OS_VERSION" \
      --build-arg UNITY_IMAGE_VERSION="$UNITY_IMAGE_VERSION" \
      --build-arg UNITY_BUILD_TARGET="$UNITY_BUILD_TARGET" \
      --build-arg UNITY_BUILD_TYPE="$UNITY_BUILD_TYPE" .
  else
    echo
    echo "Dockerfile file could not be found at $dockerfile"
  fi

elif [ "$1" = "run" ]; then
  if [ "$UNITY_OS_VERSION" = "windows" ]; then
    volumn_buildpath="$(pwd)/build:C:\app\build"
    volumn_temppath="$(pwd)/temp:C:\app\temp"
  elif [ "$UNITY_OS_VERSION" = "ubuntu" ]; then
    volumn_buildpath="$(pwd)/build:/app/build"
    volumn_temppath="$(pwd)/temp:/app/temp"
  fi

  # if container is exist, return license, stop and remove it
  # while read -r container_id; do
  #   container_exit=$(sudo docker ps -a | grep "$container_id")
  #   if [ "$container_exit" != "" ]; then
  #     sudo docker exec -it "$container_id" script/run-in-docker.sh return

  #     sudo docker stop "$container_id"
  #     sudo docker rm "$container_id"
  #   fi
  # done <containers.txt

  sudo docker compose -f docker-compose.yml up -d

  sudo docker ps | grep "$IMAGE_NAME" | awk '{print $1}' >containers.txt

elif [ "$1" = "exec" ]; then
  if [ "$#" -ne 2 ]; then
    exit 1
  else
    echo Command: $2

    while read -r container_id; do
      container="$container_id"
    done <containers.txt

    if [ "$2" = "ls" ]; then
      sudo docker exec -it "$container" ls
    elif [ "$2" = "active" ]; then
      echo execute active
      sudo docker exec -it "$container" script/run-in-docker.sh active
    elif [ "$2" = "return" ]; then
      echo execute return
      sudo docker exec -it "$container" script/run-in-docker.sh return
    fi
  fi
elif [ "$1" = "stop" ]; then
  while read -r container_id; do
    echo "stop container $(sudo docker stop "$container_id")"

    echo "remove container $(sudo docker rm "$container_id")"
  done <containers.txt
else
  echo "Invalid command. Usage: $0 {build|run|exec|stop}"
fi
