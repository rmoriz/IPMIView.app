#!/bin/sh
set -
mkdir -p Contents/Resources/IPMIView/Contents/Home/bin
tar -zxvf ~/Downloads/IPMIView*.tar.gz --strip=1 -C ./Contents/Resources/IPMIView/. ||
  tar -xvf ~/Downloads/IPMIView*.tar --strip=1 -C ./Contents/Resources/IPMIView/. ||
  { echo "Something went wrong, check download of IPMIView archive" && exit 1; }
ln -s /usr/bin/java Contents/Resources/IPMIView/Contents/Home/bin/java
rm -rf Contents/Resources/IPMIView/jre/*
pushd Contents/Resources/IPMIView/jre/
ln -s ../Contents .
popd
cd ..
rsync -arv --exclude=.git --links IPMIView.app /Applications
