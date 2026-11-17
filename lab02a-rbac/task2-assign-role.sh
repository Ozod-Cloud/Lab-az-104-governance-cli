#!/bin/bash
# Task 2: Review and assign a built-in Azure role

MG_ID=az104-mg1461
SCOPE=/providers/Microsoft.Management/managementGroups/$MG_ID

# Review common built-in roles
az role definition list --query "[?roleName=='Owner' || roleName=='Contributor' || roleName=='Reader' || roleName=='Virtual Machine Contributor'].{Role:roleName, Description:description}" -o table

# Find the group named exactly "helpdesk"
GROUP_ID=$(az ad group list --display-name helpdesk --query "[?displayName=='helpdesk'].id | [0]" -o tsv)
echo "Helpdesk group ID: $GROUP_ID"

# Assign Virtual Machine Contributor to the helpdesk group at the management group scope
az role assignment create --assignee-object-id $GROUP_ID --assignee-principal-type Group --role "Virtual Machine Contributor" --scope $SCOPE

# Verify
az role assignment list --scope $SCOPE --query "[].{Principal:principalName, Role:roleDefinitionName}" -o table