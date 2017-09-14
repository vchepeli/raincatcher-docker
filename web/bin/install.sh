#! /bin/bash

. $NVM_DIR/nvm.sh  
nvm use default
node --version
# npm install -g typescript@^2.5.0

# Clone Raincatcher AngularJS repository
cd $RAINCATCHER_INSTALL_DIR
git clone $RAINCATCHER_ANGULARJS_REPO
# Install all dependencies for angular repository
cd $RAINCATCHER_INSTALL_DIR/raincatcher-angularjs
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