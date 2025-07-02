module "lz_vending" {
  source  = "Azure/lz-vending/azurerm"
  version = ">= 4.0.2" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  # Set the default location for resources
  location = var.location

  # subscription variables
  subscription_alias_enabled = true
  subscription_billing_scope = "/providers/Microsoft.Billing/billingAccounts/${var.billing_account_name}/billingProfiles/${var.billing_profile_name}/invoiceSections/${var.invoice_section_name}"
  subscription_display_name  = var.subscription_display_name
  subscription_alias_name    = var.subscription_alias
  subscription_workload      = var.workload_type

  # management group association variables
  subscription_management_group_association_enabled = true
  subscription_management_group_id                  = var.managementgroup_Id

  # virtual network variables
  virtual_network_enabled         = true
  virtual_networks = {
    one = {
      name                    = var.vnet01_name
      location                = var.location
      address_space           = var.vnet01_address_space
      resource_group_name     = var.network_rg_name
    }
    two = {
      name                    = var.vnet02_name
      location                = var.location
      address_space           = var.vnet02_address_space
      resource_group_name     = var.network_rg_name
    }
  }
  resource_group_creation_enabled = false
  
  # role assignments
  role_assignment_enabled = false
}