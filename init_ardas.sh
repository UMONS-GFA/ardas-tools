#!/usr/bin/env bash

DEV_MODE=0
PIP_MODE=1
VERSION=''


echo "Cloning ardas repository..."
git clone https://github.com/UMONS-GFA/ardas.git
cd ~/ardas

for arg in "$@"
do
    if [ "$arg" = "--dev" ]; then
        DEV_MODE=1
    fi

    if [ "$arg" = "--nopip" ]; then
        PIP_MODE=0
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
     echo "Installing dependencies..."
     pip3 install -r requirements.txt
fi

touch ~/ardas/ardas/settings.py
ln -s ~/ardas/ardas/settings.py ~/settings
touch ~/ardas/cronlog.log
ln -s ~/ardas/cronlog.log ~/cronlog
mkdir -p ~/ardas/ardas/logs >> ~/cronlog
branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
version="$(git describe --long --dirty --abbrev=7 --tags | tr '\n' ' ')"
touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$VERSION | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
ln -s ~/ardas/ardas/logs/restart_msg.txt ~/restart_msg
touch ~/ardas/ardas/logs/msg_log
ln -s ~/ardas/ardas/logs/msg_log ~/msg_log
mkdir -p ~/ardas/ardas/data
touch ~/ardas/ardas/data/data_log
ln -s ~/ardas/ardas/data/data_log ~/data_log
cp ~/ardas/ardas/settings_example.py ~/ardas/ardas/settings.py
echo "trying to retrieve settings and sensors from /opt/ardas_config/"
cp -r /opt/ardas_config/* ~/ardas/ardas/
cat ~/ardas/instructions.txt