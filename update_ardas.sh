#!/usr/bin/env bash
rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
cd ~/ardas
if [ -z "$1" ]
then
   opt="stable"
else
   opt="$1"
fi
if [ "$opt" == "--dev" ]; then
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=7 --tags | tr '\n' ' ')"
    echo 'current commit: '$branch' | '$version
    git pull
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=7 --tags | tr '\n' ' ')"
    echo 'new commit: '$branch' | '$version
else
    git fetch
    latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
    git checkout $latest_release
fi
touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$branch' | '$version | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
nano ~/ardas/ardas/logs/restart_msg.txt
cd ~
sudo reboot
