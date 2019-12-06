#!/bin/bash

device=/dev/mmcblk1
mount_file=/home/chronos/user/.sdmounts

get_devices () {
  local -n _devs=$1
  while IFS= read -r line; do
      _devs+=( "$line" )
  done < <( ls -l /dev/mmcblk1p* | awk '{ print $10 }' )
}

devs=()

get_devices devs

rm $mount_file
touch $mount_file

for dev in "${devs[@]}"
do
  echo $dev >> $mount_file
done
