#!/bin/bash

# chmod +x "/app/script/get-activation-file.sh"
# chmod +x "/app/script/return-activation-file.sh"

# test.log is used to test if it execute correct command


echo input: $1>>test.log
if [ "$1" = "active" ]; then
  echo inner execute get>>test.log
  # Activate license Step
  /app/script/get-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$UNITY_SERIALKEY" \
    "$BUILD_TEMP_DIRECTORY"


elif [ "$1" = "return" ]; then
  echo inner execute return>>test.log
  # Return license Step
  /app/script/return-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$BUILD_TEMP_DIRECTORY"
elif [ "$1" = "pre-build" ]; then
  echo inner execute pre-build>>test.log

  /app/script/pre-build.sh $2
elif [ "$1" = "build" ]; then
  echo inner execute build>>test.log

  /app/script/build.sh $2
else
  echo "Invalid command. Usage: $0 {active|return}"
fi




