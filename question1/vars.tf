locals {
  tags = {
    "department" = "SRE"
  }
}
variable "resource_group" {
  description = "Name of resource group"
  type        = string
  default     = "sre-challenge-flashenpost"
}

variable "azure_region" {
  description = "Region to deploy resources to"
  type        = string
  default     = "West Europe"
}

variable "storage_account" {
  description = "Name of storage account must be between 3 and 24 characters long"
  type        = string
  default     = "srechallengeflaschenpost"
}

variable "account_container" {
  description = "Name of the storage account container"
  type        = string
  default     = "sre"
}