Advanced scripts
================

clean.sh
--------

Clean the log and data directory

purge.sh
--------

Remove all files from the current directory and get latest ardas release

reboot.sh
---------

Write a message to influx event database before rebooting the computer

reset_arduino_EEPROM.sh
-----------------------

Build arduino-reset sketch and upload to the arduino.
Arduino-reset flushes the serial connection, reconfigure the arduino and set raspardas mode to true in EEPROM.

update_ardas.sh
---------------

Update ardas code version.

upgrade_sketch.sh
-----------------

Build a new version of arduino sketch and upload it to the arduino.
