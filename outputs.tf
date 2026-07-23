output "organization_settings" {
  description = "GitHub organization settings resource."
  value       = try(module.organization[0].organization_settings, null)
}

output "organization_webhooks" {
  description = "Map of organization webhooks."
  value       = try(module.organization[0].organization_webhooks, null)
}

output "memberships" {
  description = "Map of organization memberships."
  value       = try(module.organization[0].memberships, null)
}
