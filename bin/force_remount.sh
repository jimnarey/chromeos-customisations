#!/bin/bash

device=$1
target_mount=$2

get_blocking_pids () {
  local -n _pids=$1
  local -n _current_mount=$2
  while IFS= read -r line; do
      _pids+=( "$line" )
  done < <( lsof +f -- $_current_mount | awk '$1 != "COMMAND" { print $2 }' )
}

current_mount=$(awk -v needle="$device" '$1==needle {print $2}' /proc/mounts)

pids=()
get_blocking_pids pids current_mount
unique_pids=($(printf "%s\n" "${pids[@]}" | sort -u | tr '\n' ' '))
for pid in "${unique_pids[@]}"
do
  kill -9 $pid
done

umount $device
mount $device $target_mount









