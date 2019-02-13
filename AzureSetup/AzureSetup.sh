# The following uses the Azure CLI to create the necessary resources in Azure

RG=[RESOURCE-GROUP-NAME]
HubName=[IOT-HUB-NAME]
DeviceId=[DEVICE-NAME]

# Create IoT hub using SKU S1 (standard) in same location as the Resource Group
echo "Create hub $HubName in Resource Group $RG..."
az iot hub create --resource-group $RG --name $HubName --sku S1 --output table

# Create a new device
echo "Create device $DeviceId..."
az iot hub device-identity create -n $HubName -d $DeviceId --output table

# The following information is requred to get the connection string used for writing messages to the IotHub from the Raspberry Pi:
echo "Connection string for writing messages from device:"
az iot hub device-identity show-connection-string --hub-name $HubName --device-id $DeviceId --output tsv

# The following are required for the IotHub Reader code

# Event Hub Compatible Endpoint
echo "Hub Endpoint:"
az iot hub show --name $HubName --query properties.eventHubEndpoints.events.endpoint

# Event Hub-compatible name
echo "Hub name:"
az iot hub show --name $HubName --query properties.eventHubEndpoints.events.path

# Access policy to allow read (example below uses default service policy)
echo "Hub access policy primary key:"
az iot hub policy show --name service --query primaryKey --hub-name $HubName
