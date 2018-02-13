#!/usr/bin/sh
rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
cd ardas
if [ $1 == "--dev" ]; then
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
    echo 'current commit: '$branch' | '$version
    git pull
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
    echo 'new commit: '$branch' | '$version
else
    git fetch
    latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
    git checkout $latest_release
fi
touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$branch' | '$version | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
nano ~/ardas/ardas/logs/restart_msg.txt
cd ..
sudo reboot
