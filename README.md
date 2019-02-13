# Raspberry Pi Azure IoT Sample
This is a sample connecting a Raspberry Pi 3 with a Sensor HAT to an Azure IoT Hub. 

This code makes use of the following code samples: 

* [Microsoft Azure IoT SDKs for Python](https://github.com/Azure/azure-iot-sdk-python)
* [Azure IoT Samples for Python](https://github.com/Azure-Samples/azure-iot-samples-python)
* [Azure IoT Samples for Csharp (.NET)](https://github.com/Azure-Samples/azure-iot-samples-csharp)
* [Raspberry Pi 3 Model B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/)
* [Sense HAT for Raspberry Pi](https://www.raspberrypi.org/products/sense-hat/)

## Azure Setup
1. Use the _AzureSetup.sh_ script to create the Azure IoT Hub, register the device, and obtain the necessary values for the hub writer and reader

## Raspberry Pi Setup
1. Attach the Sense HAT
1. Set up the Raspberry Pi 3 with one of the [Raspbian Stretch Images](https://www.raspberrypi.org/downloads/raspbian/) - I used Lite Version 4.14
1. Once the Pi is imaged and on your network, run shell script RaspberryPiCode/rasp_pi_setup.sh to install the required components, or just run the following: 

  ```
  sudo apt-get update && apt-get install -y python-pip libboost-python-dev sense-hat
  sudo pip install azure-iothub-device-client
  ```
## Reader Setup
1. Using the values from the Azure components, update the values in _IotHubReader/IotHubReader.cs_ then compile and run. This should start to read values from the IoTHub

```
IoT Hub Quickstarts - Read device to cloud messages. Ctrl-C to exit.

Create receiver and listening on partition: 0
Create receiver and listening on partition: 1
```

## Writer Setup
1. Download the Python script that sends data<br>`wget https://raw.githubusercontent.com/ssemyan/RaspberryPiAzureIot/master/RaspberryPiCode/simdev.py`
1. Update the script to add the connection string from the Azure Setup above
1. Run the script. `python simdev.py'
```
IoT Hub Quickstart #1 - Simulated device
Press Ctrl-C to exit
IoT Hub device sending periodic messages, press Ctrl-C to exit
Sending message: {"temperature": 32.13,"humidity": 29.74}
IoT Hub responded to message with status: OK
Sending message: {"temperature": 32.12,"humidity": 29.50}
IoT Hub responded to message with status: OK
Sending message: {"temperature": 32.06,"humidity": 30.08}
IoT Hub responded to message with status: OK
```

You should now be getting messages from the Reader:
```
Message received on partition 0:
  {"temperature": 32.26,"humidity": 29.56}:
Application properties (set by device):
  temperatureAlert: true
System properties (set by IoT Hub):
  iothub-connection-device-id: deviceid
  iothub-connection-auth-method: {"scope":"device","type":"sas","issuer":"iothub","acceptingIpFilterRule":null}
  iothub-connection-auth-generation-id: 636855814776821130
  iothub-enqueuedtime: 2/13/2019 2:48:57 PM
  iothub-message-source: Telemetry
  x-opt-sequence-number: 1217
  x-opt-offset: 555304
  x-opt-enqueued-time: 2/13/2019 2:48:57 PM
```
