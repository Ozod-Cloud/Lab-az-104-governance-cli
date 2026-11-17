#!/bin/bash
# Task 4: Monitor role assignments with the Activity Log

MG_ID=az104-mg1461
START=$(date -u -d '1 day ago' +%Y-%m-%dT%H:%M:%SZ)

# Read the management group Activity Log via Azure REST API (last 1 day)
az rest --method get --url "https://management.azure.com/providers/Microsoft.Management/managementGroups/$MG_ID/providers/microsoft.insights/eventtypes/management/values?api-version=2017-03-01-preview&\$filter=eventTimestamp ge '$START'" --query "value[].{Operation:operationName.localizedValue, Status:status.localizedValue, Time:eventTimestamp}" -o table