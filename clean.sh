#!/usr/bin/env bash
rm -f ~/ardas/cronlog.log
rm -rf ~/ardas/ardas/logs
rm -rf ~/ardas/ardas/data
mkdir ~/ardas/ardas/logs
mkdir ~/ardas/ardas/data
touch ~/ardas/ardas/logs/restart_msg.txt
nano ~/ardas/ardas/logs/restart_msg.txt
