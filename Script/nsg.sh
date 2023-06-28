#!/bin/bash

az vm open-port --resource-group sprint-RG --name sprint-worker-01 --port {} --priority 350
az vm open-port --resource-group sprint-RG --name sprint-worker-02 --port {} --priority 350
