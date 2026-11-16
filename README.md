# AZ-104 Lab 02b: Azure Governance via Azure CLI

Automating Azure governance controls with Azure CLI scripts, based on the Microsoft AZ-104 "Manage Governance via Azure Policy" lab.

## What each script does

| Script | Purpose |
|---|---|
| `task1-tags.sh` | Creates a resource group with a `Cost Center` tag |
| `task2-deny-policy.sh` | Assigns the built-in **Require a tag** policy (Deny effect) |
| `task2-test.sh` | Tries to create an untagged storage account, which is **denied** |
| `task3-modify-policy.sh` | Replaces Deny with **Inherit a tag** policy (Modify effect + Managed Identity) |
| `task3-test.sh` | Creates an untagged storage account; the tag is **added automatically** |
| `task4-lock.sh` | Adds a **CanNotDelete** lock and proves deletion fails (`ScopeLocked`) |

## Key lessons
- **Deny** blocks non-compliant resources; **Modify** fixes them automatically.
- Modify policies need a **Managed Identity** with permission to change resources.
- Policy assignments can take **~15 minutes** to take effect.
- **Resource locks** override user permissions and prevent accidental deletion.

## Run
```bash
bash task1-tags.sh