resource "github_organization_settings" "this" {
  billing_email = var.billing_email

  company     = var.company
  email       = var.email
  location    = var.location
  name        = var.name
  description = var.description
  blog        = var.blog

  has_organization_projects = var.has_organization_projects
  has_repository_projects   = var.has_repository_projects

  default_repository_permission            = var.default_repository_permission
  members_can_create_repositories          = var.members_can_create_repositories
  members_can_create_public_repositories   = var.members_can_create_public_repositories
  members_can_create_private_repositories  = var.members_can_create_private_repositories
  members_can_create_internal_repositories = var.members_can_create_internal_repositories
  members_can_fork_private_repositories    = var.members_can_fork_private_repositories

  web_commit_signoff_required                                  = var.web_commit_signoff_required
  advanced_security_enabled_for_new_repositories               = var.advanced_security_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.dependabot_security_updates_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.dependency_graph_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = var.secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = var.secret_scanning_push_protection_enabled_for_new_repositories
}

resource "github_organization_webhook" "this" {
  for_each = var.webhooks

  events = each.value.events
  active = each.value.active

  configuration {
    url          = each.value.configuration.url
    content_type = each.value.configuration.content_type
    secret       = each.value.configuration.secret
    insecure_ssl = each.value.configuration.insecure_ssl
  }
}

resource "github_membership" "this" {
  for_each = var.users

  username = each.key
  role     = try(each.value, "member")
}
