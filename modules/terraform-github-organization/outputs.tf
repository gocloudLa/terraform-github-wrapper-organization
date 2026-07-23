output "organization_settings" {
  description = "The organization settings."
  value       = github_organization_settings.this
}

output "organization_webhooks" {
  description = "The organization webhooks."
  value       = github_organization_webhook.this
}

output "memberships" {
  description = "Organization memberships."
  value = {
    for id, membership in github_membership.this : id => {
      username = membership.username
      role     = membership.role
    }
  }
}
