#! /bin/bash

. $NVM_DIR/nvm.sh
node --version

# Start Mobile/Portal apps
cd /opt/raincatcher/raincatcher-angularjs

exec npm run start $@
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to `npm run start $@`: $status"
  exit $status
fi