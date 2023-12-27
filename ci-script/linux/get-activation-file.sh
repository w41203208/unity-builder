#!/bin/bash

echo ""
echo "########## Get Activation-File Step ##########"
echo ""
echo "1. Activate user name: $2"
echo "2. Activate password: $3"
echo "3. Activate serial: $4"

"$1" -batchmode -username $2 -password $3 -serial $4 -logFile "$5/get-activation-file-0.log" -quit 

echo ""
EXIT_CODE=$?

echo ""
echo "Unity project finished to get activation file, exitcode: $EXIT_CODE"

if [ $EXIT_CODE -eq 0 ]; then
  echo "Successfully, got the license."
else
  echo "There is an error. Please check the log file in the temp directory."
fi
