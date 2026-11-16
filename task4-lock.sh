#!/bin/bash
# Task 4: Protect a resource group with a resource lock (CanNotDelete)
az group create --name az104-rglock --location eastus
# Add a Delete lock
az lock create --name rg-lock --lock-type CanNotDelete --resource-group az104-rglock
# Verify the lock
az lock list --resource-group az104-rglock -o table
# Test: try to delete the locked resource group (should FAIL with ScopeLocked)
az group delete --name az104-rglock --yes