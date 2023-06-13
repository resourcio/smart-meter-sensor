# Smart Meter Sensor
 
The Smart Meter Sensor makes it easy to track your energy consumption at home. Featuring an ESP32 microcontroller and an infrared interface, this sensor enables you to effortlessly read the energy consumption data from multiple smart meters. With support for the versatile Tasmota firmware, you can easily integrate the sensor into your existing smart home ecosystem. Gain real-time insights into your energy usage, identify wasteful practices, and take proactive steps towards optimizing your energy consumption. Stay in control of your energy and embrace a more sustainable future with the Smart Meter Sensor.

I created the Smart Meter Sensor out of a desire to provide an easy-to-use, compact, and customizable solution for energy monitoring. Traditional smart meter sensors can be limited in functionality or often require complex setups with multiple components. I wanted to develop a sensor that was user-friendly, cost-effective, and did not rely on batteries for power. By leveraging the ESP32, I aimed to offer a versatile sensor which is powerful, can read multiple smart meters and seamlessly integrate into existing smart home setups using MQTT. It has build in Wi-Fi with support for an external antenna for best connectivity. With the strong magnetic ring it can be securely positioned at the smart meter interface.

Supported Smart Meters

Tasmota firmware supports a wide range of smart meters using the SML (Smart Message Language) protocol. Here are the supported smart meters which are preconfigured:

1. Holley DTZ541
1. Itron ACE3000 Typ260
1. Logarex LK13BE
1. SGM C8

Please note that this is not an exhaustive list, and Tasmota firmware supports numerous other smart meters using the SML protocol. It is always recommended to refer to the Tasmota documentation and community forums for the most up-to-date information on supported smart meters and their specific configurations.

<a href="https://www.tindie.com/stores/resourcio/?ref=offsite_badges&utm_source=sellers_Resourcio&utm_medium=badges&utm_campaign=badge_small"><img src="https://d2ss6ovg47m0r5.cloudfront.net/badges/tindie-smalls.png" alt="I sell on Tindie" width="200" height="55"></a>

## How to create SML scripts which are downloaded by the tasmota device
1. run `./build_configs.sh`
1. start webserer hosting these files

## How to build firmware using docker

Prerequisite: Docker must be installed, MacOS or Linux OS
Uses Docker and https://github.com/tasmota/docker-tasmota.git to build the image

To start the build just run `./build_firmware.sh`

## How to set up a freshly flashed tasmota device

1. go to folder `/server` and run `npm start:dev` to start http server for serving files
1. find out ip address of new tasmota device
1. run `./setup_device.sh -t "<ip>"`e.g. `./setup_device.sh -t "192.168.178.2"`

If there was already tasmota installed on the device you need to perform `reset 5`in console to actually reset the device and use the settings which are specified in user_config_override.h e.g. WebColors!



## How to flash a device with esptool
1. esptool.py --port /dev/cu.usbmodem1401 erase_flash
1. esptool.py --port /dev/cu.usbmodem1401 write_flash -fs 4MB -fm dout 0x0 tasmota32c3.factory.bin
