variable "location" {
  default     = "uswest2"
  description = "Azure region where the Resource Group is created"
  type        = string
}

variable "billing_account_name" {
  description = "Name of the billing account"
  type        = string
}

variable "billing_profile_name" {
  description = "Name of the billing profile"
  type        = string
}

variable "invoice_section_name" {
  description = "Name of the invoice section"
  type        = string
}

variable "managementgroup_Id" {
  description = "Id of Management Group"
  type        = string
}

variable "workload_type" {
  default     = "Production"
  description = "Id of Management Group"
  type        = string
}

variable "subscription_display_name" {
  default     = "Subcription Vending Display Name"
  description = "Subscription Display Name"
  type        = string
}

variable "subscription_alias" {
  default     = "Production"
  description = "subcription-vending-alias-01"
  type        = string
}