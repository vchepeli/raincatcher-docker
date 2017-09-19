#! /bin/bash

. $NVM_DIR/nvm.sh  
nvm use default
node --version

# Clone Raincatcher Core repository
cd $RAINCATCHER_INST_DIR
git clone $RAINCATCHER_CORE_REPO

# Install node modules for angular repository
cd $RAINCATCHER_INST_DIR/raincatcher-core
npm install
status=$?
if [ $status -ne 0 ]; then
  echo "Failed `npm install`: $status"
  exit $status
fi

npm run bootstrap
status=$?
if [ $status -ne 0 ]; then
  echo "Failed `npm run bootstrap`: $status"
  exit $status
fi