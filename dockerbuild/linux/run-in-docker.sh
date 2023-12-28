#!/bin/bash

# chmod +x "/app/script/get-activation-file.sh"
# chmod +x "/app/script/return-activation-file.sh"

echo input: $1>test.log
if [ "$1" = "active" ]; then
  echo ""
  echo ""
  echo "-------------- Get Activation File --------------"
  echo ""
  echo inner execute get>test.log
  # Activate license Step
  /app/script/get-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$UNITY_SERIALKEY" \
    "$BUILD_TEMP_DIRECTORY"


elif [ "$1" = "return" ]; then
  echo ""
  echo ""
  echo "-------------- Return Activation File --------------"
  echo ""

  echo inner execute return>test.log
  # Return license Step
  /app/script/return-activation-file.sh \
    "unity-editor" \
    "$UNITY_USERNAME" \
    "$UNITY_PASSWORD" \
    "$BUILD_TEMP_DIRECTORY"
else
  echo "Invalid command. Usage: $0 {active|return}"
fi




