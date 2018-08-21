Getting Started
===============

Preparation
-----------
* Prepare a raspberry pi with a RASPBIAN STRETCH LITE and an arduino board
* Make sure the pi and arduino are turned-off
* Insert the ardas shield in the arduino board
* Connect the arduino board to the raspberry pi with a USB cable (no external power cable for the arduino board)
* Power up the raspberry pi and wait for the raspberry pi to boot
* Log on the raspberry pi (using ssh)

Download the code
-----------------

    To deploy ardas-tools including ardas::

        rm -rf * .git .gitignore && git init && git remote add origin https://github.com/UMONS-GFA/ardas-tools.git && git pull origin master


Initialization and setup
------------------------
* For production


    To initiate stable branch of ardas::

        bash init_ardas.sh

    To update stable branch::

        bash update_ardas.sh

    These scripts can take quite a long time to retrieve the python dependencies, espacially when using a rapsberry pi one.
    See the nopipenv_ option for the alternative

* For developers

    To initiate development branch of ardas::

        bash init_ardas.sh --dev

    To update development branch::

        bash update_ardas.sh --dev

    Follow the instructions to set the approriate sensors and acquisition settings.

Configure the ardas
-------------------
* Set the default arduino config::

        bash reset_arduino_EEPROM.sh

* Upload the sketch in the arduino::

        bash upgrade_sketch.sh


Start logging
-------------
    To reboot the raspberry.py and start logging::

        bash reboot.sh

    Don't forget to type a message to explain in which circumstances (and eventually by whom) the system is rebooted. It show in the logs when the system will restart.

Options
-------

* Update code without automatically rebooting(only for update_ardas script)::

        --noreboot

.. _nopipenv:
* Prevent creating a new virtual environment and installing all dependencies

    Installing dependencies could be slow on a raspberry pi. If you plan to install several identical loggers,
    it could be advisable to create a disk image with the right dependencies installed in the virtual environment.
    The following option will prevent the system from creating a new virtual environment and installing all dependencies::

        --nopipenv

