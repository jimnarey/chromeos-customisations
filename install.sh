#!/bin/bash

mkdir -p /usr/local/bin
# echo $CROS_USER_ID_HASH > /home/chronos/user/.customuserhash

cd bin
chmod +x *
cd ../vendor/bin
chmod +x *
cd ../../init
chmod 644 *
cd ..

cp --verbose ./bin/* /usr/local/bin
cp --verbose ./vendor/bin/* /usr/local/bin
cp --verbose ./init/* /etc/init
