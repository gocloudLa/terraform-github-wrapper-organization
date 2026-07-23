module "organization" {
  source = "./modules/terraform-github-organization"
  count  = local.organization_enable

  billing_email = try(var.organization_parameters.billing_email, var.organization_defaults.billing_email, null)
  company       = try(var.organization_parameters.company, var.organization_defaults.company, null)
  email         = try(var.organization_parameters.email, var.organization_defaults.email, null)
  location      = try(var.organization_parameters.location, var.organization_defaults.location, null)
  name          = try(var.organization_parameters.name, var.organization_defaults.name, null)
  description   = try(var.organization_parameters.description, var.organization_defaults.description, null)
  blog          = try(var.organization_parameters.blog, var.organization_defaults.blog, null)

  has_organization_projects                = try(var.organization_parameters.has_organization_projects, var.organization_defaults.has_organization_projects, true)
  has_repository_projects                  = try(var.organization_parameters.has_repository_projects, var.organization_defaults.has_repository_projects, true)
  default_repository_permission            = try(var.organization_parameters.default_repository_permission, var.organization_defaults.default_repository_permission, "read")
  members_can_create_repositories          = try(var.organization_parameters.members_can_create_repositories, var.organization_defaults.members_can_create_repositories, false)
  members_can_create_public_repositories   = try(var.organization_parameters.members_can_create_public_repositories, var.organization_defaults.members_can_create_public_repositories, false)
  members_can_create_private_repositories  = try(var.organization_parameters.members_can_create_private_repositories, var.organization_defaults.members_can_create_private_repositories, false)
  members_can_create_internal_repositories = try(var.organization_parameters.members_can_create_internal_repositories, var.organization_defaults.members_can_create_internal_repositories, false)
  members_can_fork_private_repositories    = try(var.organization_parameters.members_can_fork_private_repositories, var.organization_defaults.members_can_fork_private_repositories, false)
  web_commit_signoff_required              = try(var.organization_parameters.web_commit_signoff_required, var.organization_defaults.web_commit_signoff_required, false)

  advanced_security_enabled_for_new_repositories               = try(var.organization_parameters.advanced_security_enabled_for_new_repositories, var.organization_defaults.advanced_security_enabled_for_new_repositories, true)
  dependabot_alerts_enabled_for_new_repositories               = try(var.organization_parameters.dependabot_alerts_enabled_for_new_repositories, var.organization_defaults.dependabot_alerts_enabled_for_new_repositories, true)
  dependabot_security_updates_enabled_for_new_repositories     = try(var.organization_parameters.dependabot_security_updates_enabled_for_new_repositories, var.organization_defaults.dependabot_security_updates_enabled_for_new_repositories, true)
  dependency_graph_enabled_for_new_repositories                = try(var.organization_parameters.dependency_graph_enabled_for_new_repositories, var.organization_defaults.dependency_graph_enabled_for_new_repositories, true)
  secret_scanning_enabled_for_new_repositories                 = try(var.organization_parameters.secret_scanning_enabled_for_new_repositories, var.organization_defaults.secret_scanning_enabled_for_new_repositories, true)
  secret_scanning_push_protection_enabled_for_new_repositories = try(var.organization_parameters.secret_scanning_push_protection_enabled_for_new_repositories, var.organization_defaults.secret_scanning_push_protection_enabled_for_new_repositories, true)

  webhooks = try(var.organization_parameters.webhooks, var.organization_defaults.webhooks, {})
  users    = try(var.organization_parameters.users, var.organization_defaults.users, {})
}
