#!/usr/bin/env bash

echo "Updating packages list…"
apt update
echo "Upgrading packages…"
apt upgrade
echo "Installing python3 packages…"
apt install python3 python3-dev python3-pip
echo "Installing ardas required packages…"
apt install openjdk-8-jdk-headless
#fix missing openjdk for Debian Stretch
mkdir /usr/lib/jvm/java-1.8.0-openjdk-armhf/jre/lib/arm/server
ln -s /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/client/libjvm.so /usr/lib/jvm/java-8-openjdk-armhf/jre/lib/arm/server/libjvm.so
# end of fix
apt install arduino cmake gcc-avr binutils-avr avr-libc avrdude
apt install ntp
#fix for numpy error ( libf77blas.so.3: cannot open shared object file)
apt-get install libatlas-base-dev