# Define the Azure region where the resources will be deployed
location = "uswest2"

# Billing account ID associated with the Azure tenant (GUID format)
billing_account_name = "8772fef8-6127-4051-837b-4d1792781e8a"

# Name of the billing profile under the billing account
billing_profile_name = "WERE-FSDG-FGF-HFR"

# Name of the invoice section under the billing profile for cost tracking
invoice_section_name = "WRTE-HYUJ-TYI-QWE"

# Management group ID to associate the subscription with (used for governance)
managementgroup_Id = "financeDepartment"

# Workload type for the subscription (e.g., Development, Production)
workload_type = "Production"

# Display name for the new Azure subscription
subscription_display_name = "sample Subscription Name"

# Alias for the Azure subscription (used for programmatic reference)
subscription_alias = "sample-alias"

#network Resource Group name
network_rg_name = rg-networking-vnet-01

#Virtual network Names
vnet01_name = "contoso-vnet-aue-001"
vnet02_name = "contoso-vnet-aue-002"

#virtual network Address Spaces
vnet01_address_space = [ "172.10.10.0/24" ]
vnet02_address_space = [ "10.100.10.0/25" ]