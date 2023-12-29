#!/bin/bash

# will change this code
path="$(pwd)/$UNITY_PROJECT_NAME"
if [ -e "$path" ]; then
  cd path
  git fetch
  git pull origin webRTC-dev-feature-buildtool
else
  git clone $1 --branch webRTC-dev-feature-buildtool --depth=1
fi

# git clone $1 --branch webRTC-dev-feature-buildtool --depth=1

path="build/$UNITY_PROJECT_BUILD_FOLDER_NAME"
if [ ! -d "$path" ]; then
  mkdir "$path"
fi



