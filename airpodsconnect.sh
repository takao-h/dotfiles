#!/bin/bash
AIR_PODS_ADDRESS=38-ec-0d-4e-ef-64 # Your AirPods MAC address
AIR_PODS_NAME="恭央のAirPods Pro" # Your AirPods name

/usr/local/bin/bluetoothconnector -c $AIR_PODS_ADDRESS
for ((i=0 ; i<10 ; i++))
do
    if [ "Connected" == $(/usr/local/bin/bluetoothconnector  -s $AIR_PODS_ADDRESS) ]; then
        sleep 1
        #/usr/local/Cellar/switchaudio-osx/1.1.0/SwitchAudioSource -s  $AIR_PODS_NAME
        /usr/local/bin/SwitchAudioSource -s $AIR_PODS_NAME
        sleep 1
        say -v samantha Connected
        break
    fi
    sleep 1
done
