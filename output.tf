### [BEGIN] output.tf ###
output "resource_group_id" {
  value = join("", module.resource_group.*.id)
}

output "resource_group_name" {
  value = join("", module.resource_group.*.name)
}

output "resource_group_tags" {
  value = module.resource_group[0].tags
}
### [END] output.tf ###