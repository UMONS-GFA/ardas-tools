#!/usr/bin/env bash
git clone https://github.com/UMONS-GFA/ardas.git
cd ~/ardas
if [ ! -z "$1" ]
then
   opt="stable"
else
   opt="$1"
fi

if [ "$opt" == "--dev" ]; then
    echo "Switching to development version"
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
    echo 'current commit: '$branch' | '$version
    git pull
    branch="$(git rev-parse --abbrev-ref HEAD | tr '\n' ' ')"
    version="$(git describe --long --dirty --abbrev=6 --tags | tr '\n' ' ')"
    echo 'new commit: '$branch' | '$version
else
    echo "Switching to stable version"
    latest_release="$(git describe --tags `git rev-list --tags --max-count=1`)"
    git checkout $latest_release
fi
touch ~/ardas/ardas/settings.py
ln -s ~/ardas/ardas/settings.py ~/settings
touch ~/ardas/cronlog.log
ln -s ~/ardas/cronlog.log ~/cronlog
mkdir -p ~/ardas/ardas/logs >> ~/cronlog
touch ~/ardas/ardas/logs/restart_msg.txt
ln -s ~/ardas/ardas/logs/restart_msg.txt restart_msg
touch ~/ardas/ardas/logs/msg_log
ln -s ~/ardas/ardas/logs/msg_log ~/msg_log
touch ~/ardas/ardas/logs/data_log
ln -s ~/ardas/ardas/logs/data_log ~/data_log
mv ~/ardas/ardas/settings_example.py ~/ardas/ardas/settings.py
cat ~/ardas/instructions.txt