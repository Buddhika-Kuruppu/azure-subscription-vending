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
      name                    = "my-vnet"
      location                = var.location
      address_space           = ["192.168.1.0/24"]
      resource_group_name     = "rg-networking-vnet-01"
    }
    two = {
      name                    = "my-vnet-2"
      location                = var.location
      address_space           = ["192.168.2.0/24"]
      resource_group_name     = "rg-networking-vnet-01"
    }
  }
  resource_group_creation_enabled = false
  
  # role assignments
  role_assignment_enabled = false
}