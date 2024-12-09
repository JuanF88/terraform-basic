resource "azurerm_resource_group" "rg_primary" {
  for_each = var.resource_groups
  location = module.shared_objects.region[each.value.location]
  name     = "${var.domain}-domain-${module.shared_objects.environment_abbrevation}-${module.shared_objects.region_abbrevation[each.value.location]}-${each.value.iterator}-${var.bounded_context[each.value.bounded_context]}-rg"
}