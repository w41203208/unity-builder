#!/bin/bash


BuildPath=$2
BuildFileDestinationPath="$BuildPath/Coin Pusher"

echo ""
echo ""
echo "########## Compress Step ##########"
echo ""
echo "1. Compress target: $1"
echo "2. Build File DestinationPath: $BuildFileDestinationPath"

if [ "$1" = "Linux64" ]; then
  CompressFileDestinationPath="$BuildPath/Coin Pusher_linux_version"
elif [ "$1" = "Win64" ]; then
  CompressFileDestinationPath="$BuildPath/Coin Pusher_windows_version"
fi

echo "3. Compress File DestinationPath: $CompressFileDestinationPath"

# # Check if the destination path exists, create it if not
# mkdir -p "$BuildPath"

# Zip the contents of the source directory
zip -r $CompressFileDestinationPath.zip "$BuildFileDestinationPath"


EXIT_CODE=$?

echo ""
echo "Compress result - exitcode: $EXIT_CODE"

if [ "$EXIT_CODE" = "0" ]; then
  echo "Finish to compress, file is "$CompressFileDestinationPath".zip"
else
  echo "There is something error happened."
fi