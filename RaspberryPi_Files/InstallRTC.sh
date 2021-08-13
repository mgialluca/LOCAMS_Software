
#!/bin/bash

# Disable fake hw-clock

echo -n "Have you checked the module is visible to the pi by running '# i2cdetect -y 1'? (y/n)"
read answer

if [ "$answer" != 'y' ]
then
exit 0
fi

echo -n "Did you run this script as super user? (y/n)"
read answer

if [ "$answer" != 'y' ]
then
exit 0
fi

echo -n "Did you ensure your timezone is set appropriately and that the pi is currently showing the correct time? (y/n)"
read answer

if [ "$answer" != 'y' ]
then
exit 0
fi

apt-get -y remove fake-hwclock
update-rc.d -f fake-hwclock remove
systemctl disable fake-hwclock

wget https://raw.githubusercontent.com/mgialluca/LOCAMS_Software/main/RaspberryPi_Files/hwclock-set_RTCModule

mv hwclock-set_RTCModule /lib/udev/hwclock-set -f

hwclock -r
hwclock -w
