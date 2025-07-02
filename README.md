# Azure Subscription Vending with Terraform

This repository automates the creation and configuration of Azure subscriptions using the [`lz_vending`](https://registry.terraform.io/modules/Azure/lz-vending/azurerm/latest) Terraform module. It provisions a new subscription, associates it with the appropriate billing profile, and links it to a management group for governance and policy enforcement.

## 💡 Overview

This solution is intended for organizations managing Azure at scale using Landing Zones (LZ). By using this module, you can standardize and automate the vending of subscriptions based on your organization's needs (e.g., production, development).

## 📁 Files

- **`main.tf`** – Declares and configures the `lz_vending` module.
- **`providers.tf`** – Configures the required Terraform providers (e.g., AzureRM).
- **`variables.tf`** – Declares input variables used across the configuration.
- **`terraform.tfvars`** – Provides concrete values for variables used in `variables.tf`.

## 🔧 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.4 or higher
- Azure CLI (`az login`)
- Sufficient permissions to create subscriptions and assign roles in Azure

## 📦 Module Used

<code>
module "lz_vending" {
  source  = "Azure/lz-vending/azurerm"
  version = ">= 4.0.2"
  # additional inputs provided via terraform.tfvars
}</code>

# Terraform Azure DevOps Pipeline Guide

This pipeline automates Terraform deployments for Azure infrastructure, supporting both apply and destroy operations with built-in validation and approval workflows.

## Prerequisites

- Azure DevOps project with appropriate service connections
- Terraform configuration files in `product-lines/corpworkloads/` directory
- Variable group named `variable-group` with backend configuration
- Service connection named `authorization-connection`

## Required Variables

Configure these variables in your Azure DevOps variable group:

- `BACKEND_RESOURCE_GROUP` - Resource group containing Terraform state storage
- `BACKEND_STORAGE_ACCOUNT` - Storage account for Terraform state
- `BACKEND_CONTAINER_NAME` - Container name for state files

## Pipeline Parameters

### Terraform Action
- **apply** (default) - Plan and apply infrastructure changes
- **destroy** - Plan and destroy infrastructure

### Confirm Destroy
- Required checkbox when using destroy action
- Safety mechanism to prevent accidental resource deletion

### Terraform State File Name
- Optional parameter for custom state file naming
- If empty, auto-generates from subscription alias in `terraform.tfvars`
- Must contain the subscription alias and end with `.tfstate`

## Usage Instructions

### 1. Setup Your Terraform Configuration

Ensure your `terraform.tfvars` file contains:
```hcl
subscription_alias = "your-subscription-name"
# ... other variables
```

### 2. Running the Pipeline

#### For Infrastructure Deployment:
1. Select **Action**: `apply`
2. Leave **Terraform State File Name** empty for auto-generation, or specify custom name
3. Run pipeline
4. Review plan output
5. Approve deployment when prompted

#### For Infrastructure Destruction:
1. Select **Action**: `destroy`
2. Check **Confirm Destroy** checkbox
3. Specify state file name if different from auto-generated
4. Run pipeline
5. Review destroy plan
6. Approve destruction when prompted (⚠️ **IRREVERSIBLE**)

### 3. State File Management

The pipeline automatically:
- Extracts subscription alias from `terraform.tfvars`
- Generates state file name as `{subscription-alias}.tfstate`
- Validates state file naming conventions
- Ensures state file contains subscription alias

## Pipeline Stages

1. **Validate** - Parameter validation and configuration extraction
2. **Plan/Plan Destroy** - Terraform plan generation
3. **Apply/Destroy** - Manual approval + execution

## Safety Features

- ✅ Automatic parameter validation
- ✅ State file naming validation
- ✅ Manual approval gates for all operations
- ✅ Destroy confirmation requirement
- ✅ Backend configuration validation
- ✅ Cross-stage variable persistence

## Troubleshooting

### Common Issues:

**State file validation errors:**
- Ensure `terraform.tfvars` contains `subscription_alias = "value"`
- State file name must end with `.tfstate`
- Custom state file names must contain the subscription alias

**Variable group errors:**
- Verify `variable-group` exists and contains backend variables
- Check service connection `authorization-connection` permissions

**Cross-stage variable issues:**
- Pipeline uses artifact-based variable passing for reliability
- Check validation stage logs for configuration extraction

## Security Notes

- All operations require manual approval
- Destroy operations have additional confirmation requirements
- Pipeline validates configuration before execution
- State files are securely stored in Azure Storage