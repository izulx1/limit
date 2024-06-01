#!/bin/bash

if [[ ! -e /etc/crontab ]]; then
apt install cron -y
fi

wget -O /usr/sbin/limit-ip-ssh "https://raw.githubusercontent.com/izulx1/limit/master/limit-ip-ssh"
chmod +x /usr/sbin/limit-ip-ssh

anu=$(cat /etc/crontab | grep "limit-ip-ssh" | wc -l)
if [[ $anu == "1" ]]; then
sleep 2
else
echo "*/1 * * * * root /usr/sbin/limit-ip-ssh" > /etc/crontab
fi

systemctl restart cron
echo "Done, Installed Limit IP SSH Successfully"
sleep 2
