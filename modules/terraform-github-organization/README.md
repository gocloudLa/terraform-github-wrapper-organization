# GitHub Organization Terraform Module

Manage GitHub organization settings, security defaults, webhooks, and user invitations.

## Features
- Organization settings and default permissions
- Security defaults for new repositories
- Organization webhooks
- User invitations with role defaults

## Usage
```hcl
module "github_organization" {
  source = "./modules/github/organization"

  billing_email = "admin@company.com"
  company       = "My Company"
  email         = "contact@company.com"
  location      = "United States"
  name          = "my-company"
  description   = "My GitHub organization"

  advanced_security_enabled_for_new_repositories               = true
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true

  users = {
    "alice-mycompany" = "admin"
    "bob-mycompany"   = "member"
  }
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `billing_email` | The billing email address for the organization. | `string` | n/a | Yes |
| `company` | The company name for the organization. | `string` | `null` | No |
| `email` | The email address for the organization. | `string` | `null` | No |
| `location` | The location for the organization. | `string` | `null` | No |
| `name` | The name for the organization. | `string` | `null` | No |
| `description` | The description for the organization. | `string` | `null` | No |
| `blog` | The blog URL for the organization. | `string` | `null` | No |
| `has_organization_projects` | Whether organization projects are enabled. | `bool` | `true` | No |
| `has_repository_projects` | Whether repository projects are enabled. | `bool` | `true` | No |
| `default_repository_permission` | The default repository permission for organization members (`read`, `write`, `admin`, `none`). | `string` | `"read"` | No |
| `members_can_create_repositories` | Whether members can create repositories. | `bool` | `true` | No |
| `members_can_create_public_repositories` | Whether members can create public repositories. | `bool` | `true` | No |
| `members_can_create_private_repositories` | Whether members can create private repositories. | `bool` | `true` | No |
| `members_can_create_internal_repositories` | Whether members can create internal repositories. | `bool` | `true` | No |
| `members_can_fork_private_repositories` | Whether members can fork private repositories. | `bool` | `false` | No |
| `web_commit_signoff_required` | Whether web commit signoff is required. | `bool` | `false` | No |
| `advanced_security_enabled_for_new_repositories` | Whether advanced security is enabled for new repositories. | `bool` | `true` | No |
| `dependabot_alerts_enabled_for_new_repositories` | Whether Dependabot alerts are enabled for new repositories. | `bool` | `true` | No |
| `dependabot_security_updates_enabled_for_new_repositories` | Whether Dependabot security updates are enabled for new repositories. | `bool` | `true` | No |
| `dependency_graph_enabled_for_new_repositories` | Whether dependency graph is enabled for new repositories. | `bool` | `true` | No |
| `secret_scanning_enabled_for_new_repositories` | Whether secret scanning is enabled for new repositories. | `bool` | `true` | No |
| `secret_scanning_push_protection_enabled_for_new_repositories` | Whether secret scanning push protection is enabled for new repositories. | `bool` | `true` | No |
| `webhooks` | Map of organization webhooks. | `map(object({ events = list(string), active = bool, configuration = object({ url = string, content_type = string, secret = string, insecure_ssl = bool }) }))` | `{}` | No |
| `users` | Map of users to invite to the organization (key: username, value: role). | `map(string)` | `{}` | No |
| `github_defaults` | Default values for organization users role. | `object({ organization = object({ users = object({ role = string }) }) })` | `{ organization = { users = { role = "member" } } }` | No |

## Outputs
- `organization_settings`
- `organization_webhooks`

## Requirements
- Terraform >= 1.0
- GitHub provider >= 6.0
