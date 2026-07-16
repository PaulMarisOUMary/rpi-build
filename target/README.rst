Raspberry Pi Models: Hardware & Firmware Mapping
================================================

* `Raspberry Pi Documentation <https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#flagship-series>`_
* `Compute Module Documentation <https://www.raspberrypi.com/documentation/computers/compute-module.html#models>`_
* `Raspberry Pi Zero Documentation <https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#zero-series>`_
* `Raspberry Pi Pico Documentation <https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html>`_
* `Keyboard Computer Documentation <https://www.raspberrypi.com/documentation/computers/keyboard-computers.html>`_
* `Additional Information <https://pip-assets.raspberrypi.com/categories/505-computers>`_
* `CPU Tree Values <https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#check-raspberry-pi-model-and-cpu-across-distributions>`_
* `Raspberry's Linux Kernel <https://www.raspberrypi.com/documentation/computers/linux_kernel.html>`_
* `Raspberry Pi config.txt Documentation <https://www.raspberrypi.com/documentation/computers/config_txt.html>`_
* `firmware-brcm80211 Linux Documentation <https://wireless.docs.kernel.org/en/latest/en/users/drivers/brcm80211.html>`_

-------

Raspberry Pi Models Matrix
==========================

.. list-table::
    :width: 100%
    :header-rows: 1

    * - Model
      - SoC
      - CPU
      - Wireless
      - Firmware ``dtb``
      - Firmware ``sdio``
      - Firmware ``bluez``
      - Memory
    * - Raspberry Pi Model B
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - /
      - /
      - /
      - /
      - | 256 MB
        | 512 MB
    * - Raspberry Pi Model A
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - /
      - /
      - /
      - /
      - 256 MB
    * - Raspberry Pi Model B+
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - /
      - /
      - /
      - /
      - 512 MB
    * - Raspberry Pi Model A+
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - /
      - /
      - /
      - /
      - | 256 MB
        | 512 MB
    * - Raspberry Pi 2 Model B
      - | revision 1.1: `BCM2836 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2836>`_
        | revision 1.2: `BCM2837 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837>`_
        | revision 1.3: `BCM2837B0 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837b0>`_
      - | revision 1.1: 4x Cortex-A7 @ 900 MHz 32bit
        | revision 1.2: 4x Cortex-A53 @ 900 MHz 64bit
        | revision 1.3: 4x Cortex-A53 @ 900 MHz 64bit
      - /
      - /
      - /
      - /
      - 1 GB
    * - Raspberry Pi 3 Model B
      - | revision 1.1: `BCM2837 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837>`_
        | revision 1.2: `BCM2837B0 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837b0>`_
      - | revision 1.1: 4x Cortex-A53 @ 1.2 GHz 64bit
        | revision 1.2: 4x Cortex-A53 @ 1.2 GHz 64bit
      - BCM43438
      - bcm2710
      - brcmfmac43430
      - BCM43430A1
      - 1 GB
    * - Raspberry Pi 3 Model B+
      - `BCM2837B0 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837b0>`_
      - 4x Cortex-A53 @ 1.2 GHz (up to 1.4GHz) 64bit
      - CYW43455
      - bcm2710
      - brcmfmac43455
      - BCM4345C0
      - 1 GB
    * - Raspberry Pi 3 Model A+
      - `BCM2837B0 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837b0>`_
      - 4x Cortex-A53 @ 1.2 GHz (up to 1.4GHz) 64bit
      - CYW43455
      - bcm2710
      - brcmfmac43455
      - BCM4345C0
      - 512 MB
    * - Raspberry Pi 4 Model B
      - `BCM2711 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2711>`_
      - 4x Cortex-A72 @ 1.8 GHz 64bit
      - CYW43455
      - bcm2711
      - brcmfmac43455
      - BCM4345C0
      - | 1 GB
        | 2 GB
        | 3 GB
        | 4 GB
        | 8 GB
    * - Raspberry Pi 5
      - `BCM2712 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712>`_
      - 4x Cortex-A76 @ 2.4 GHz 64bit
      - CYW43455
      - bcm2712
      - brcmfmac43455
      - BCM4345C0
      - | 1 GB
        | 2 GB
        | 4 GB
        | 8 GB
        | 16 GB
    * - Compute Module 3
      - `BCM2837 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837>`_
      - 4x Cortex-A53 @ 1.2 GHz 64bit
      - None
      - bcm2710
      - None
      - None
      - 1 GB
    * - Compute Module 3+
      - `BCM2837B0 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837b0>`_
      - 4x Cortex-A53 @ 1.2 GHz (up to 1.4GHz) 64bit
      - None
      - bcm2710
      - None
      - None
      - 1 GB
    * - Compute Module 4
      - `BCM2711 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2711>`_
      - 4x Cortex-A72 @ 1.5 GHz 64bit
      - Optional CYW43455
      - bcm2711
      - | brcmfmac43455
        | brcmfmac43456
      - | BCM4345C0
        | BCM4345C5
      - | 1 GB
        | 2 GB
        | 4 GB
        | 8 GB
    * - Compute Module 4S
      - `BCM2711 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2711>`_
      - 4x Cortex-A72 @ 1.5 GHz 64bit
      - Optional CYW43455
      - bcm2711
      - | brcmfmac43455
        | brcmfmac43456
      - | BCM4345C0
        | BCM4345C5
      - | 1 GB
        | 2 GB
        | 4 GB
        | 8 GB
    * - Compute Module 5
      - `BCM2712 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712>`_
      - 4x Cortex-A76 @ 2.4 GHz 64bit
      - Optional CYW43455
      - bcm2712
      - brcmfmac43455
      - BCM4345C0
      - | 2 GB
        | 4 GB
        | 8 GB
        | 16 GB
    * - Raspberry Pi Zero
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - None
      - /
      - None
      - None
      - 512 MB
    * - Raspberry Pi Zero W/WH
      - `BCM2835 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2835>`_
      - 1x ARM1176JZF-S @ 700 MHz 32bit
      - /
      - /
      - /
      - /
      - 512 MB
    * - Raspberry Pi Zero 2 W/WH
      - `RP3A0 <https://www.raspberrypi.com/documentation/computers/processors.html#rp3a0>`_
      - 4x Cortex-A53 @ 1 GHz 64bit
      - /
      - /
      - /
      - /
      - 512 MB
    * - Raspberry Pi 400
      - `BCM2711 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2711>`_
      - 4x Cortex-A72 @ 1.5 GHz 64bit
      - /
      - /
      - /
      - /
      - 4 GB
    * - Raspberry Pi 500
      - `BCM2712 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712>`_
      - 4x Cortex-A76 @ 2.4 GHz 64bit
      - /
      - /
      - /
      - /
      - 8 GB
    * - Raspberry Pi 500+
      - `BCM2712 <https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712>`_
      - 4x Cortex-A76 @ 2.4 GHz 64bit
      - /
      - /
      - /
      - /
      - 8 GB

.. note::

    Values marked with a ``/`` represent missing data (Work In Progress).

-------

Useful Commands
===============

Run these commands on a live Raspberry Pi to check hardware specs and inspect firmware packages.

Hardware Detection
------------------

.. code-block:: bash

    # Hardware model name
    cat /proc/device-tree/compatible | tr '\0' '\n'

    # Detailed layout of the board components and buses
    sudo apt update && sudo apt install lshw -y
    lshw

Firmware Inspection
-------------------

.. code-block:: bash

    # List all firmware files for Broadcom & Cypress
    ls -l /usr/lib/firmware/brcm/
    ls -l /usr/lib/firmware/cypress/
    ls -l /lib/firmware/brcm/
    ls -l /lib/firmware/cypress/

    # See installed files from the Broadcom WiFi firmware package
    dpkg -L firmware-brcm80211

    # Find which packages own the Broadcom & Cypress firmware files
    dpkg -S /usr/lib/firmware/brcm/*
    dpkg -S /usr/lib/firmware/cypress/*
    dpkg -S /lib/firmware/brcm/*
    dpkg -S /lib/firmware/cypress/*

    # Download packages locally to inspect them without installing
    apt download raspi-firmware
    apt download linux-image-rpi-v8
    apt download firmware-brcm80211

    # Check the contents and folder structure of the downloaded .deb files
    dpkg -c raspi-firmware*.deb
    dpkg -c linux-image-rpi-v8*.deb
    dpkg -c firmware-brcm80211*.deb