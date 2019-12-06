#!/bin/bash

var=$(cat /home/chronos/user/.customuserhash)

echo test > /home/chronos/user/teststatic.txt
echo $var > /home/chronos/user/testid.txt
touch /home/chronos/user/$var.txt
touch /home/chronos/user/teststatic2.txt
