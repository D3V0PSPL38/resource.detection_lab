module "detection_lab" {
  source      = "../../"
  for_each    = var.detection_lab
  enabled     = each.value.enabled
  name        = each.value.name
  namespace   = each.value.namespace
  environment = each.value.environment
  stage       = each.value.stage
  location    = each.value.location
}