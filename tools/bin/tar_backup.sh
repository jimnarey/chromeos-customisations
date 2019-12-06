#!/bin/bash

tar -cvpzf $1 \
--exclude=./proc \
--exclude=./tmp \
--exclude=./mnt \
--exclude=./dev \
--exclude=./sys \
--exclude=./run \
--exclude=./media \
--exclude=./var/log \
--exclude=./usr/src/linux-headers* \
--exclude=./lost+found .
