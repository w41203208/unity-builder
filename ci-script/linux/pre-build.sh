#!/bin/bash

# will change this code
path="$(pwd)/Coin-Pusher-Dannis"
if [ -e "$path"]; then
  rmdir -r "$path"
fi

git clone $1 --branch webRTC-dev-feature-buildtool --depth=1

mkdir "build/Coin Pusher"


