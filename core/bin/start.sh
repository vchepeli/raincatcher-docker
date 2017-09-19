#! /bin/bash

. $NVM_DIR/nvm.sh
node --version

# Start Core module
cd $RAINCATCHER_INST_DIR/raincatcher-core
exec npm run start $@
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to `npm run start $@`: $status"
  exit $status
fi