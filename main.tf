### [BEGIN] main.tf ###
resource "time_static" "deploy_date" {}

module "resource_group" {
  source          = "github.com/D3V0PSPL38/terraform-azurerm-resource-group.git"
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  attributes      = var.attributes
  label_order     = var.label_order
  id_length_limit = var.id_length_limit
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  tags            = var.tags
  context         = module.this.context
}

module "vnet" {
  source          = "github.com/D3V0PSPL38/azurerm.virtual_network.git"
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  attributes      = var.attributes
  label_order     = var.label_order
  id_length_limit = var.id_length_limit
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  create_resource_group = var.create_vnet_resource_group
  tags            = var.tags
  context         = module.this.context
}
### [END] main.tf ###