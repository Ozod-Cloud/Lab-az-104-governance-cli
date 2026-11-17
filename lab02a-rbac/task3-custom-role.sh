#!/bin/bash
# Task 3: Create a custom RBAC role (clone + exclude a permission)

MG_ID=az104-mg1461
SCOPE=/providers/Microsoft.Management/managementGroups/$MG_ID
ROLE_NAME="Custom Support Request OJ-$RANDOM"

# Get the built-in role to clone
az role definition list --name "Support Request Contributor" --query "[0]" > base-role.json

# Build the custom role JSON: same Actions, add a NotAction, scope to our management group
jq --arg name "$ROLE_NAME" --arg scope "$SCOPE" '{Name: $name, IsCustom: true, Description: "A custom contributor role for support requests.", Actions: .permissions[0].actions, NotActions: ["Microsoft.Support/register/action"], AssignableScopes: [$scope]}' base-role.json > custom-role.json

# Review the JSON (Actions, NotActions, AssignableScopes)
cat custom-role.json

# Create the custom role
az role definition create --role-definition @custom-role.json -o table
