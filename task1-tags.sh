#!/bin/bash
# Task 1: Create a resource group with a Cost Center tag
az group create --name az104-rg2 --location eastus --tags "Cost Center=000"
# Verify the tag
az group show --name az104-rg2 --query tags