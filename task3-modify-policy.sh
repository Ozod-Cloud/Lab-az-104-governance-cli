#!/bin/bash
# Task 3: Inherit the Cost Center tag from the resource group (Modify effect)
RG=$(az group show --name az104-rg2 --query id -o tsv)
# Remove the Deny policy from Task 2
az policy assignment delete --name require-cc-tag --scope $RG
# Find the built-in "Inherit a tag" policy definition
DEF2=$(az policy definition list --query "[?displayName=='Inherit a tag from the resource group if missing'].name" -o tsv)
# Assign it with a Managed Identity that can modify resources
az policy assignment create --name inherit-cc-tag --display-name "Inherit the Cost Center tag and its value 000 from the resource group if missing" --policy $DEF2 --scope $RG --params '{"tagName":{"value":"Cost Center"}}' --mi-system-assigned --location eastus --identity-scope $RG --role Contributor
# Verify
az policy assignment list --scope $RG -o table