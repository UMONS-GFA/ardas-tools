#!/usr/bin/env bash

DEV_MODE=0
PIPENV_MODE=0

echo "Cloning ardas repository..."
git clone https://github.com/UMONS-GFA/ardas.git
cd ~/ardas

for arg in "$@"
do
    if [ "$arg" == "--dev" ]; then
        DEV_MODE=1
    fi

    if [ "$arg" == "--pipenv" ]; then
        PIPENV_MODE=1
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
     echo "Installing dependencies..."
     pipenv --python 3
     pipenv shell
     pipenv install
fi

touch ~/ardas/ardas/settings.py
ln -s ~/ardas/ardas/settings.py ~/settings
touch ~/ardas/cronlog.log
ln -s ~/ardas/cronlog.log ~/cronlog
mkdir -p ~/ardas/ardas/logs >> ~/cronlog
touch ~/ardas/ardas/logs/restart_msg.txt
ln -s ~/ardas/ardas/logs/restart_msg.txt ~/restart_msg
touch ~/ardas/ardas/logs/msg_log
ln -s ~/ardas/ardas/logs/msg_log ~/msg_log
touch ~/ardas/ardas/logs/data_log
ln -s ~/ardas/ardas/logs/data_log ~/data_log
cp ~/ardas/ardas/settings_example.py ~/ardas/ardas/settings.py
echo "trying to retrieve settings and sensors"
cp -r /opt/ardas_config/* ~/ardas/ardas/
cat ~/ardas/instructions.txt