#!/bin/sh

# Init
THIS_DIR=$(pwd)
INSTALL_DIR=$1
SETUP_DIR=$(mktemp -d -t meteor-freebsd-XXXXXXXX)

# Default install path
if [ -z "$INSTALL_DIR" ]; then INSTALL_DIR=$(pwd)/meteor; fi

# Print info
echo "Current directory is... ${THIS_DIR}"
echo "Setup directory is... ${SETUP_DIR}"
echo "Install directory is... ${INSTALL_DIR}"

# Download Meteor
git clone --recursive https://github.com/meteor/meteor.git $INSTALL_DIR
git -C $INSTALL_DIR checkout tags/release/METEOR@1.4.1.1

# Download Pataches
git clone https://github.com/tuaris/meteor-freebsd.git $SETUP_DIR

# Patch for FreeBSD
cp ${SETUP_DIR}/patches/archinfo.js ${INSTALL_DIR}/tools/utils/archinfo.js
cp ${SETUP_DIR}/patches/bundler.js ${INSTALL_DIR}/tools/isobuild/bundler.js
cp ${SETUP_DIR}/patches/freebsd-dev-bundle.sh ${INSTALL_DIR}/scripts/freebsd-dev-bundle.sh
cp ${SETUP_DIR}/patches/meteor ${INSTALL_DIR}/meteor

# Generate Devbundle
cd ${INSTALL_DIR}
scripts/freebsd-dev-bundle.sh

# Done
cd $THIS_DIR
rm -Rf $SETUP_DIR
