#!/usr/bin/env bash

DEV_MODE=0
PIPENV_MODE=0
REBOOT_MODE=1

rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
cd ~/ardas
git fetch

for arg in "$@"
do
    if [ "$arg" == "--dev" ]; then
        DEV_MODE=1
    fi

    if [ "$arg" == "--pipenv" ]; then
        PIPENV_MODE=1
    fi

    if [ "$arg" == "--noreboot" ]; then
        REBOOT_MODE=0
    fi
done

if [ $DEV_MODE -eq 1 ]; then
    echo "Switching to development version..."
    git checkout develop
    git pull
    git status
    git log --max-count=1
else
    echo "Switching to stable version..."
    latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
    git checkout $latest_release
fi

if [ $PIPENV_MODE -eq 1 ]; then
     echo "Updating dependencies..."
     pipenv update
fi

if [ $REBOOT_MODE -eq 1 ]; then
    touch ~/ardas/ardas/logs/restart_msg.txt
    echo 'installing new version: '$branch' | '$version | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
    nano ~/ardas/ardas/logs/restart_msg.txt
    cd ~
    sudo reboot
fi









