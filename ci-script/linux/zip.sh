#!/bin/bash

# enter unity project
cd $1

# execute zip
BuildPath=$BUILD_TARGET_DIRECTORY
BuildFileDestinationPath="$BuildPath/$UNITY_PROJECT_BUILD_FOLDER_NAME"

BuildTarget=$UNITY_PROJECT_BUILD_TARGET


echo ""
echo ""
echo "########## Compress Step ##########"
echo ""
echo "1. Compress target: $BuildTarget"
echo "2. Build File DestinationPath: $BuildFileDestinationPath"

if [ "$BuildTarget" == "Linux64" ]; then
  CompressFileDestinationPath="$BuildPath/${UNITY_PROJECT_BUILD_FOLDER_NAME}_linux_version"
elif [ "$BuildTarget" == "Win64" ]; then
  CompressFileDestinationPath="$BuildPath/${UNITY_PROJECT_BUILD_FOLDER_NAME}_windows_version"
fi

echo "3. Compress File DestinationPath: $CompressFileDestinationPath"

# # Check if the destination path exists, create it if not
# mkdir -p "$BuildPath"


# this code will make current path move
cd $BuildPath

# Zip the contents of the source directory
if [ -f "$CompressFileDestinationPath.zip" ]; then
  rm -r "$CompressFileDestinationPath.zip"
fi
zip -r "$CompressFileDestinationPath.zip" "Coin Pusher"

EXIT_CODE=$?

echo ""
echo "Compress result - exitcode: $EXIT_CODE"

if [ "$EXIT_CODE" == "0" ]; then
  echo "Finish to compress, file is $CompressFileDestinationPath.zip"
else
  echo "There is something error happened."
fi

exit $EXIT_CODE