#!/bin/bash

mkdir -p /usr/local/bin
# echo $CROS_USER_ID_HASH > /home/chronos/user/.customuserhash

cd tools/bin
chmod +x *
cd ../../vendor/bin
chmod +x *
cd ../../sd_home_remount/bin
chmod +x *
cd ../init
chmod 644 *
cd ../../runchroot/bin
chmod +x *
cd ../..

cp --verbose ./tools/bin/* /usr/local/bin
# cp --verbose ./runchroot/bin/* /usr/local/bin
# cp --verbose ./sd_home_remount/bin/* /usr/local/bin
# cp --verbose ./sd_home_remount/init/* /etc/init
cp --verbose ./sd_auto_remount/bin/* /usr/local/bin
cp --verbose ./sd_auto_remount/init/* /etc/init
cp --verbose ./vendor/bin/* /usr/local/bin

