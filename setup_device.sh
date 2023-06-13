#!/bin/bash

DEVICE_NAME="Resourcio%20Smart%20Meter%20Sensor"
FRIENDLY_NAME="Resourcio"
#MQTT_ENABLED="1" always enabled to allow correct hostname pattern (HOST_NAME-last 4 digits of mac)
HTTP_ENABLED="1"
MDNS_ENABLED="1"
DISABLED_MODEL_NAME_IN_HEADER="1"
HOST_NAME="Resourcio"
OTA_URL="https%3A%2F%2Fresourcio-webapp-production.azurewebsites.net%2Ffirmware%2Ftasmota32.bin"
#https://resourcio-webapp-production.azurewebsites.net/firmware/tasmota32.bin
#CONFIG_URL="https%3A%2F%2Fresourcio-webapp-production.azurewebsites.net%2Fconfigs%2Fautoexec.be"
#https://resourcio-webapp-production.azurewebsites.net/configs/autoexec.be



# curl "http://192.168.178.77/cm?cmnd=UfsFree"
# curl "http://192.168.178.77/cm?cmnd=Restart%201"
# curl "http://192.168.178.77/cm?cmnd=UfsRun%autoexec.be"
# curl "http://192.168.178.77/cm?cmnd=UfsDelete2"
# curl "http://192.168.178.77/cm?cmnd=SerialLog%204"

helpFunction()
{
   echo ""
   echo "Usage: $0 -t 192.168.1.1 "
   echo -e "\t -t Target ip address of the tasmota device to be configured"
   exit 1 # Exit script after printing help
}
while getopts "t:" opt
do
   case "$opt" in
      t ) parameterIp="$OPTARG";;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterIp" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "Starting to configure device with ip $parameterIp"

serverIp=myip
myip () { ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}'; }
# 1. download berry script to device
curl "http://$parameterIp/cm?cmnd=UrlFetch%20http://`myip`:8081/autoexec.be"

# 2. configure device with correct name and settings
# When using web requests (Don't forget to encode "space" as '%20' and ";" as '%3B')
configBacklog="http://$parameterIp/cm?cmnd=Backlog%20"

# MQTT Topic & Hostname
#curl "http://$parameterIp/cm?cmnd=Topic%20$HOST_NAME"
configBacklog+="Topic%20$HOST_NAME%3B"

#curl "http://$parameterIp/cm?cmnd=Hostname%201" 

#mdns 
#curl "http://$parameterIp/cm?cmnd=SetOption55%20$MDNS_ENABLED"
configBacklog+="SetOption55%20$MDNS_ENABLED%3B"

#hostname in header 
#curl "http://$parameterIp/cm?cmnd=SetOption141%20$DISABLED_MODEL_NAME_IN_HEADER"	
configBacklog+="SetOption141%20$DISABLED_MODEL_NAME_IN_HEADER%3B"

# mqtt enabled - permanently disabled!
# curl "http://$parameterIp/cm?cmnd=SetOption3%20$MQTT_ENABLED"

#http enabled
#curl "http://$parameterIp/cm?cmnd=SetOption128%20$HTTP_ENABLED"
configBacklog+="SetOption128%20$HTTP_ENABLED%3B"

#device name 
#curl "http://$parameterIp/cm?cmnd=DeviceName%20$DEVICE_NAME"
configBacklog+="DeviceName%20$DEVICE_NAME%3B"

#friendly name
#curl "http://$parameterIp/cm?cmnd=FriendlyName%20$FRIENDLY_NAME"
configBacklog+="FriendlyName%20$FRIENDLY_NAME%3B"

#ota url
configBacklog+="OtaUrl%20$OTA_URL%3B"


curl $configBacklog
echo "$configBacklog"

#configure gpios
# curl "http://$parameterIp/md?g99=0&g0=0&g1=0&g2=0&g3=0&g4=0&g5=0&g6=0&g7=0&g8=0&g9=0&g10=0&g18=0&g19=0&g20=0&g21=0&save="

#restart device
curl "http://$parameterIp/cm?cmnd=Restart%201"

# 3. run tests
# tbd