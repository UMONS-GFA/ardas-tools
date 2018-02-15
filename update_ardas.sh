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
git fetch
if [ "$opt" == "--dev" ]; then
   echo "Switching to development version..."
   git checkout develop
   git status
   git log --max-count=1
else
   echo "Switching to stable version..."
   latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
   git checkout $latest_release
fi
echo "Updating dependencies..."
pipenv update
touch ~/ardas/ardas/logs/restart_msg.txt
echo 'installing new version: '$branch' | '$version | tr '\n' '.' >> ~/ardas/ardas/logs/restart_msg.txt
nano ~/ardas/ardas/logs/restart_msg.txt
cd ~
sudo reboot
