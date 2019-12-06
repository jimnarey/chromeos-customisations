sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification
sudo crossystem dev_boot_signed_only=0
sudo mount -o remount,rw /
