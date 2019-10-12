#!/bin/bash

chroot_partition='/dev/mmcblk1p3'
target_mount='/home/chronos/user/mounts/crouton'

# remount.sh $chroot_partition $target_mount

current_mount=$(awk -v needle="$chroot_partition" '$1==needle {print $2}' /proc/mounts)
if [ "$current_mount" != "$target_mount" ]; then
  force_remount.sh $chroot_partition $target_mount
fi

current_mount=$(awk -v needle="$chroot_partition" '$1==needle {print $2}' /proc/mounts)
if [ "$current_mount" == "$target_mount" ]; then
  startcli
else
  echo "Incorrect chroot mount point"
fi
