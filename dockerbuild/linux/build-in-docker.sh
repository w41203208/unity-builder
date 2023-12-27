#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

chmod +x "$SCRIPT_DIR/ci/linux/get-activation-file.sh"
chmod +x "$SCRIPT_DIR/ci/linux/build.sh"
chmod +x "$SCRIPT_DIR/ci/linux/zip.sh"
chmod +x "$SCRIPT_DIR/ci/linux/return-activation-file.sh"


echo ""
echo ""
echo "-------------- Build Unity Project --------------"
echo ""

# Activate license Step
$SCRIPT_DIR/ci/linux/get-activation-file.sh \
  "unity-editor" \
  "$UNITY_USERNAME" \
  "$UNITY_PASSWORD" \
  "$UNITY_SERIALKEY" \
  "$BUILD_TEMP_DIRECTORY" \
  "$BUILD_PROJECT_PATH"

# Build Step
$SCRIPT_DIR/ci/linux/build.sh \
  "/opt/unity/Editor/Unity" \
  "$BUILD_PROJECT_PATH" \
  "$BUILD_TARGET" \
  "$BUILD_TARGET_PATH/Coin Pusher" \
  "$BUILD_TARGET_PATH/Coin Pusher/Coin Pusher" \
  "$BUILD_TEMP_DIRECTORY"

EXIT_CODE=$?

# Compress Step
$SCRIPT_DIR/ci/linux/zip.sh "$BUILD_TARGET" "$BUILD_TARGET_PATH"

# Return license Step
$SCRIPT_DIR/ci/linux/return-activation-file.sh \
  "unity-editor" \
  "$UNITY_USERNAME" \
  "$UNITY_PASSWORD" \
  "$BUILD_TEMP_DIRECTORY"

exit $EXIT_CODE