#!/bin/bash
rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
echo updating ardas tools
git pull
echo updating ardas code
cd ardas
branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
echo 'current commit: '$branch' | '$version 
git pull
branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
echo 'new commit: '$branch' | '$version 
touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$branch' | '$version | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
nano ~/ardas/ardas/logs/restart_msg.txt
cd ..
sudo reboot
