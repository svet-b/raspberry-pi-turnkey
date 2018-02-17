#!/bin/bash

sleep 3

# disable the AP
sudo systemctl stop dnsmasq && sudo systemctl stop hostapd
sudo cp config/hostapd.disabled /etc/default/hostapd
sudo cp config/dhcpcd.conf.disabled /etc/dhcpcd.conf
sudo cp config/dnsmasq.conf.disabled /etc/dnsmasq.conf
sudo systemctl daemon-reload
sudo systemctl restart dhcpcd
sudo systemctl start hostapd && sudo systemctl start dnsmasq

# load wlan configuration
sudo cp wpa.conf /etc/wpa_supplicant/wpa_supplicant.conf

sudo reboot now