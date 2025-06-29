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

```hcl
module "lz_vending" {
  source  = "Azure/lz-vending/azurerm"
  version = ">= 4.0.2"
  # additional inputs provided via terraform.tfvars
}
