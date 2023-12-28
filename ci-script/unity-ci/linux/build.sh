#!/bin/bash

UNITY_PATH=$1
PROJECT_PATH="$2"
BUILD_TARGET="$3"
DIRECTORY="$4"
DESTINATION_PATH="$5"

echo ""
echo "########## Build Step ##########"
echo ""
echo "1. Build Unity-Editor: $UNITY_PATH"
echo "2. Build target: $BUILD_TARGET"
echo "3. Build project: $PROJECT_PATH"
echo "4. Build destinationPath: $DIRECTORY"
rm -rf "$DIRECTORY"
mkdir "$DIRECTORY"

$UNITY_PATH \
  -quit \
  -batchmode \
  -nographics \
  -logFile "$6/build-log-0.log" \
  -projectPath "$PROJECT_PATH" \
  -buildTarget "$BUILD_TARGET" \
  -destinationPath "$DESTINATION_PATH" \
  -executeMethod BuildTool.Build 

EXIT_CODE=$?

echo ""
echo "Unity project finished to build, exitcode: $EXIT_CODE"

if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Congratulation, unity project has been built successfully."
else
  echo "There is something error happened, please go to see log file in temp directory."
fi
