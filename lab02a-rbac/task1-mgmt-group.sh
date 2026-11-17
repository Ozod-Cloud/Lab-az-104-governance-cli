#!/bin/bash
# Task 1: Implement management groups
# View tenant (Microsoft Entra ID) details
az account show --query "{Subscription:name, TenantId:tenantId, User:user.name}" -o table
# Create a management group with a unique 3-digit ID
MG_ID=az104-mg$((RANDOM % 900 + 100))
 az account management-group create --name $MG_ID --display-name az104-mg1
# Create a resource group
az group create --name az104-rg2 --location eastus
# Verify
az account management-group show --name $MG_ID -o table
 az group list -o table