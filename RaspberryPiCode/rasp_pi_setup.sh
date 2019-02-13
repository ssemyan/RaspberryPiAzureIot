# Use this script to set up your jessie-based Raspberry Pi 3 to run python
# and load the libraries for the Sensor Hat 

# install required apt-get packages
apt-get update && apt-get install -y python-pip libboost-python-dev sense-hat

# now install the azure iothub client using pip
pip install azure-iothub-device-client
