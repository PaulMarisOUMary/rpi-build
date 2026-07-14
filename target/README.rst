Raspberry Pi Models: Hardware & Firmware Mapping
================================================

* `Raspberry Pi Documentation <https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#flagship-series>`_
* `Compute Module Documentation <https://www.raspberrypi.com/documentation/computers/compute-module.html#models>`_
* `CPU Tree Values <https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#check-raspberry-pi-model-and-cpu-across-distributions>`_

-------

Raspberry Pi Models Matrix
==========================

.. list-table::
    :width: 100%
    :header-rows: 1

    * - Model
      - Soc
      - CPU
      - Wireless
      - Firmware ``dtb``
      - Firmware ``sdio``
      - Firmware ``bluez``
      - Memory
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
    sudo apt install lshw -y
    lshw

Firmware Inspection
-------------------

.. code-block:: bash

    # See installed files installed by the Broadcom WiFi firmware package
    dpkg -L firmware-brcm80211

    # Find which packages own the Broadcom & Cypress firmware files
    dpkg -S /lib/firmware/brcm/*
    dpkg -S /lib/firmware/cypress/*

    # Download packages locally to inspect them without installing
    apt-get download raspi-firmware
    apt-get download linux-image-rpi-v8
    apt-get download firmware-brcm80211

    # Check the contents and folder structure of the downloaded .deb files
    dpkg -c raspi-firmware_*.deb
    dpkg -c linux-image-rpi-v8_*.deb
    dpkg -c firmware-brcm80211_*.deb