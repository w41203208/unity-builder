#!/bin/bash

# will change this code
original_path="$(pwd)"
path="$(pwd)/$UNITY_PROJECT_NAME"
if [ -e "$path" ]; then
  cd "$path"
  git fetch
  git pull origin webRTC-dev-feature-buildtool
else
  git clone $1 --branch webRTC-dev-feature-buildtool --depth=1
fi

cd "$original_path"

# git clone $1 --branch webRTC-dev-feature-buildtool --depth=1

path="build/$UNITY_PROJECT_BUILD_FOLDER_NAME"
if [ ! -d "$path" ]; then
  mkdir "$path"
fi



