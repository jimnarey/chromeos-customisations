#!/bin/bash

get_devices () {
  local -n _devs=$1
  while IFS= read -r line; do
      _devs+=( "$line" )
  done < <( ls -l /dev/mmcblk1p* | awk '{ print $10 }' )
}

devs=()

get_devices devs

for dev in "${devs[@]}"
do
  echo $dev
done