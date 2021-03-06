#!/usr/bin/env bash

DEV_MODE=0
PIP_MODE=1
REBOOT_MODE=1
VERSION=''

rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
cd ~/ardas
git fetch

for arg in "$@"
do
    if [ "$arg" = "--dev" ]; then
        DEV_MODE=1
    fi

    if [ "$arg" = "--nopip" ]; then
        PIP_MODE=0
    fi

    if [ "$arg" = "--noreboot" ]; then
        REBOOT_MODE=0
    fi
done

if [ $DEV_MODE -eq 1 ]; then
    echo "Switching to development version..."
    git fetch
    git checkout develop
    git pull
    git status
    git log --max-count=1
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=7 --tags | tr '\n' ' ')"
    VERSION=$branch' | '$version
else
    echo "Switching to stable version..."
    latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
    git checkout $latest_release
    VERSION=$latest_release

fi

if [ $PIP_MODE -eq 1 ]; then
     echo "Updating dependencies..."
     pip3 install -r requirements.txt
fi


touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$VERSION | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
rm ~/VERSION*
touch ~/'VERSION'$VERSION | tr '\n' '.'
nano ~/ardas/ardas/logs/restart_msg.txt
cd ~
if [ $REBOOT_MODE -eq 1 ]; then
    sudo reboot
fi









