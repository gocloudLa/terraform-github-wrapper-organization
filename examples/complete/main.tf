module "wrapper_organization" {
  source = "../../"

  metadata = local.metadata

  organization_parameters = {
    enable = true

    billing_email = "billing@example.com"
    company       = "Example"
    email         = "info@example.com"
    location      = "Example City"
    name          = "Example Org"
    description   = "Example organization for Terraform labs"
    blog          = "https://www.example.com"

    # Default: read
    default_repository_permission = "none"

    # Default: true
    advanced_security_enabled_for_new_repositories               = false
    dependabot_alerts_enabled_for_new_repositories               = true
    dependabot_security_updates_enabled_for_new_repositories     = true
    dependency_graph_enabled_for_new_repositories                = true
    secret_scanning_enabled_for_new_repositories                 = true
    secret_scanning_push_protection_enabled_for_new_repositories = true

    users = {
      "user1-example" = "member"
      "user2-example" = "member"
      "admin1-example" = "admin"
    }

    # webhooks = {
    #   "slack" = {
    #     events = ["push", "pull_request"]
    #     active = true
    #     configuration = {
    #       url          = "https://hooks.example.com/github"
    #       content_type = "json"
    #       secret       = "replace-me"
    #       insecure_ssl = false
    #     }
    #   }
    # }
  }
}
