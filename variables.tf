### [BEGIN] variables.tf ###
variable "resource_group_label" {
  description = <<EOD
  [Set] azurerm_resource_group label
  EOD
  type = object({
    name            = optional(string)
    attributes      = optional(list(string))
    label_order     = optional(list(string))
    id_length_limit = optional(number)
  })
  default = {
    name        = "rg"
    attributes  = ["azurerm_resource_group"]
    label_order = ["name", "namespace", "environment", "stage", "location", "tenant"]
  }
  validation {
    condition     = contains(["rg"], var.resource_group_label["name"])
    error_message = <<EOM
    Resource group label name values cannot be defined.
    EOM
  }
  validation {
    condition     = contains(["azurerm_resource_group"], element(var.resource_group_label["attributes"], 0))
    error_message = <<EOM
    Resource group label attributes values cannot be defined.
    EOM
  }
}

variable "vnet_label" {
  description = <<EOD
  [Set] azurerm_virtual_network label
  EOD
  type = object({
    name        = optional(string)
    attributes  = optional(list(string))
    label_order = optional(list(string))
  })
  default = {
    name            = "vnet"
    attributes      = ["azurerm_virtual_network"]
    label_order     = ["name", "namespace"]
    id_length_limit = 30
  }
  validation {
    condition     = contains(["rg"], var.vnet_label["name"])
    error_message = <<EOM
    Virtual Network label name values cannot be defined.
    EOM
  }
  validation {
    condition     = contains(["azurerm_virtual_network"], element(var.vnet_label["attributes"], 0))
    error_message = <<EOM
    Virtual Network label attributes values cannot be defined.
    EOM
  }
  validation {
    condition = !(var.vnet_label["id_length_limit"] > 30) ? true : false
    error_message = <<EOM
    Virtual Network Label cannot be longer than 30 characters
    EOM
  }
}

variable "create_vnet_resource_group" {
  description = <<EOD
  [Set] Create a resource group for the virtual network
  EOD
  type        = bool
  default     = false
}
### [END] variables.tf ###
