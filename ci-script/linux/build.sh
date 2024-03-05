#!/bin/bash

# enter unity project
cd $1

# original
# sh build-in-docker.sh
# imporve
echo ""
echo "########## Build Step ##########"
echo ""
echo "1. Build target: $UNITY_PROJECT_BUILD_TARGET"
echo "2. Build project: $UNTIY_PROJECT_PATH"
echo "3. Build destinationPath: $BUILD_TARGET_PATH/$UNITY_PROJECT_BUILD_EXECUTE_NAME"

# maybe use timestamp to store, don't remove old version folder
rm -rf "$BUILD_TARGET_PATH"
mkdir "$BUILD_TARGET_PATH"



# Build Project
"/opt/unity/Editor/Unity" \
  -quit \
  -batchmode \
  -nographics \
  -logFile "$BUILD_TEMP_DIRECTORY/build-log-0.log" \
  -projectPath "$UNTIY_PROJECT_PATH" \
  -buildTarget "$UNITY_PROJECT_BUILD_TARGET" \
  -destinationPath "$BUILD_TARGET_PATH/$UNITY_PROJECT_BUILD_EXECUTE_NAME" \
  -executeMethod BuildTool.Build 

EXIT_CODE=$?

echo ""
echo "Unity project finished to build, exitcode: $EXIT_CODE"

if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Congratulation, unity project has been built successfully."
else
  echo "There is something error happened, please go to see log file in temp directory."
fi

exit $EXIT_CODE


