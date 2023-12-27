#!/bin/bash

echo ""
echo ""
echo "########## Return Activation-File Step ##########"
echo ""

"$1" -quit -nographics -batchmode -username "$2" -password "$3" -returnlicense -logFile "$4/return-license-file-0.log"

echo ""
EXIT_CODE=$?

echo ""
echo "Unity project finished to return activation file, exitcode: $EXIT_CODE"

if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Successfully, returned license."
else
  echo "There is something error happened, please go to see log file in temp directory."
fi