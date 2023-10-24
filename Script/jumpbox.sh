#! /bin/bash

az group create \
    --name sprint-RG \
    --location koreacentral


az vm create \
    --resource-group sprint-RG \
    --name sprint-jumpbox \
    --size Standard_B1s \
    --image Ubuntu2204 \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username sprint \
    --admin-password Azuresprint12#$ \
    --public-ip-sku basic \
    --custom-data cloud-init.txt

az vm open-port --resource-group sprint-RG --name sprint-jumpbox --port 80 --priority 110
az vm open-port --resource-group sprint-RG --name sprint-jumpbox --port 5000 --priority 120
