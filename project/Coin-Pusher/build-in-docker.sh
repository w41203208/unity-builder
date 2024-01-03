#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

chmod +x "$SCRIPT_DIR/ci/linux/build.sh"
chmod +x "$SCRIPT_DIR/ci/linux/zip.sh"

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

EXIT_CODE=$?

exit $EXIT_CODE