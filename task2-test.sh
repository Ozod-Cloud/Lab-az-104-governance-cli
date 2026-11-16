#!/bin/bash
# Task 2 test: Create a storage account WITHOUT the tag (should be DENIED by policy)
az storage account create --name az104st$RANDOM --resource-group az104-rg2 --location eastus --sku Standard_LRS