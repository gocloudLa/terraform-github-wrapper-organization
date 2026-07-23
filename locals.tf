locals {
  organization_enable = try(var.organization_parameters.enable, false) ? 1 : 0
}
