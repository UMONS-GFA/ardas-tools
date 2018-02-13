#!/usr/bin/sh
git clone https://github.com/UMONS-GFA/ardas.git
touch ~/ardas/ardas/settings.py
ln -s ~/ardas/ardas/settings.py settings
touch ~/ardas/cronlog.log
ln -s ~/ardas/cronlog.log cronlog
mkdir -p ~/ardas/ardas/logs &>2 /dev/null
touch ~/ardas/ardas/logs/restart_msg.txt
ln -s ~/ardas/ardas/logs/restart_msg.txt restart_msg
touch ~/ardas/ardas/logs/msg_log
ln -s ~/ardas/ardas/logs/msg_log msg_log
touch ~/ardas/ardas/logs/data_log
ln -s ~/ardas/ardas/logs/data_log data_log
