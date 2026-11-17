# AZ-104 Lab 02a: Manage Subscriptions and RBAC via Azure CLI

Automating Azure RBAC tasks with Azure CLI scripts, based on the Microsoft AZ-104 "Manage Subscriptions and RBAC" lab.

## What each script does

| Script | Purpose |
|---|---|
| `task1-mgmt-group.sh` | Shows tenant details, creates the `az104-mg1` management group and the `az104-rg2` resource group |
| `task2-assign-role.sh` | Reviews built-in roles and assigns **Virtual Machine Contributor** to the `helpdesk` group at management group scope |
| `task3-custom-role.sh` | Clones **Support Request Contributor** into a custom role with `jq` and excludes `Microsoft.Support/register/action` (NotAction) |
| `task4-activity-log.sh` | Reads the management group Activity Log via `az rest` to audit role changes |

## Key lessons
- Management groups organize subscriptions; roles assigned there are inherited.
- The creator of a management group automatically becomes **Owner**.
- Custom roles apply **least privilege**: clone a built-in role and remove what is not needed.
- The **Activity Log** records every role change, including failed attempts.

## Real-world issues I solved
- **Permission propagation delay:** management group creation failed at first and succeeded a few minutes later.
- **Shared tenant name conflicts:** matched the `helpdesk` group by exact name and gave the custom role a unique suffix.
- **CLI gaps:** `az monitor activity-log` has no management group option, so I called the REST API with `az rest`.
- **Assignment type:** the portal creates an *Eligible* (PIM) assignment by default; `az role assignment create` creates an *Active* one.