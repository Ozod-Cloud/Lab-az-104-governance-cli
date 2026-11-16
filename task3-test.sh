#!/bin/bash
# Task 3 test: Create a storage account WITHOUT the tag (policy should add it automatically)
SA=az104st$RANDOM
 az storage account create --name $SA --resource-group az104-rg2 --location eastus --sku Standard_LRS
# Verify the tag was inherited from the resource group
az storage account show --name $SA --resource-group az104-rg2 --query tags