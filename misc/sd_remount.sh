#!/bin/bash

get_blocking_pids () {
  local -n _pids=$1
  local -n _current_mount=$2
  while IFS= read -r line; do
      _pids+=( "$line" )
  done < <( lsof +f -- $_current_mount | awk '$1 != "COMMAND" { print $2 }' )
}

user_hash=af119e9546e4f7d915e9a058d1942bd3fb442fa2

user_files=/home/chronos/u-$user_hash/MyFiles

data_partition='/dev/mmcblk1p4'
data_target_mount=$user_files/Shared

chroot_partition='/dev/mmcblk1p3'
chroot_target_mount='/home/chronos/user/mounts/crouton'

linux_partition='/dev/mmcblk1p2'
linux_target_mount=$user_files/Arch

mkdir -p $data_target_mount
mkdir -p $chroot_target_mount
mkdir -p $linux_target_mount

# force_remount.sh $data_partition $data_target_mount
# force_remount.sh $chroot_partition $chroot_target_mount
# force_remount.sh $linux_partition $linux_target_mount

current_chroot_mount=$(awk -v needle="$chroot_partition" '$1==needle {print $2}' /proc/mounts)
current_data_mount=$(awk -v needle="$data_partition" '$1==needle {print $2}' /proc/mounts)
current_linux_mount=$(awk -v needle="$linux_partition" '$1==needle {print $2}' /proc/mounts)

pids=()
get_blocking_pids pids current_chroot_mount
get_blocking_pids pids current_data_mount
get_blocking_pids pids current_linux_mount

unique_pids=($(printf "%s\n" "${pids[@]}" | sort -u | tr '\n' ' '))
for pid in "${unique_pids[@]}"
do
  kill -9 $pid
done

mount data_partition data_target_mount
mount chroot_partition chroot_target_mount
mount linux_partition linux_target_mount


# rmdir /media/removable/SD\ Card
# rmdir /media/removable/Chroots
# rmdir /media/removable/Shared



# current_mount=$(awk -v needle="$data_partition" '$1==needle {print $2}' /proc/mounts)
# if [ "$current_mount" != "$data_target_mount" ]; then
#   force_remount.sh $data_partition $data_target_mount
# fi

# current_mount=$(awk -v needle="$chroot_partition" '$1==needle {print $2}' /proc/mounts)
# if [ "$current_mount" != "$chroot_target_mount" ]; then
#   force_remount.sh $chroot_partition $chroot_target_mount
# fi

# current_mount=$(awk -v needle="$linux_partition" '$1==needle {print $2}' /proc/mounts)
# if [ "$current_mount" != "$linux_target_mount" ]; then
#   force_remount.sh $linux_partition $linux_target_mount
# fi
