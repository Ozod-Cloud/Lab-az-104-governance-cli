#!/bin/bash
# Task 2: Enforce tagging with Azure Policy (Deny effect)
# Get the resource group ID (policy scope)
RG=$(az group show --name az104-rg2 --query id -o tsv)
# Find the built-in policy definition
DEF=$(az policy definition list --query "[?displayName=='Require a tag and its value on resources'].name" -o tsv)
# Assign the policy to the resource group
az policy assignment create --name require-cc-tag --display-name "Require Cost Center tag and its value on resources" --policy $DEF --scope $RG --params '{"tagName":{"value":"Cost Center"},"tagValue":{"value":"000"}}'
# Verify the assignment
az policy assignment list --scope $RG -o table