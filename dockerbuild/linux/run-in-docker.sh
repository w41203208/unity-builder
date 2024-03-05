#!/bin/bash

# chmod +x "/app/script/get-activation-file.sh"
# chmod +x "/app/script/return-activation-file.sh"

# test.log is used to test if it execute correct command


if [ "$1" = "active" ]; then
  # Activate license Step
  /app/script/get-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$UNITY_SERIALKEY" \
    "$BUILD_TEMP_DIRECTORY"

elif [ "$1" = "return" ]; then
  # Return license Step
  /app/script/return-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$BUILD_TEMP_DIRECTORY"

elif [ "$1" = "pre-build" ]; then
  /app/script/pre-build.sh "$2"
elif [ "$1" = "build" ]; then
  /app/script/build.sh "$2"
elif [ "$1" = "zip" ]; then
  /app/script/zip.sh "$2"
else
  echo "Invalid command. Usage: $0 {active|return}"
fi




