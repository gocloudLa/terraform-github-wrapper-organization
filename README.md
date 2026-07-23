# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform Organization Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-github-wrapper-organization/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-github-wrapper-organization.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-github-wrapper-organization.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-organization/github"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform wrapper for GitHub Organization simplifies configuration of organization settings, memberships, and webhooks. It provides an opinionated template for managing org-wide defaults and security posture for new repositories.


### ✨ Features

- 🏢 [Organization Settings](#organization-settings) - Manage org profile and repository creation defaults

- 🔒 [Security Defaults For New Repositories](#security-defaults-for-new-repositories) - Enable Dependabot, dependency graph, and secret scanning

- 👥 [Membership Management](#membership-management) - Invite users with member or admin roles

- 🔔 [Organization Webhooks](#organization-webhooks) - Configure org-level webhook endpoints




## 🚀 Quick Start
```hcl
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
```


## 🔧 Additional Features Usage

### Organization Settings
Configures `github_organization_settings` including profile fields, default repository permissions, and whether members can create or fork repositories.


<details><summary>Minimal profile</summary>

```hcl
organization_parameters = {
  enable = true
  billing_email = "billing@example.com"
  company       = "Example"
  name          = "Example Org"
  # Default: read
  default_repository_permission = "none"
}
```


</details>


### Security Defaults For New Repositories
Applies org-wide defaults for Advanced Security, Dependabot alerts/updates, dependency graph, and secret scanning push protection on newly created repositories.


<details><summary>Hardened defaults</summary>

```hcl
organization_parameters = {
  enable = true
  billing_email = "billing@example.com"
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
  # Default: true
  advanced_security_enabled_for_new_repositories = false
}
```


</details>


### Membership Management
Creates `github_membership` resources from a username-to-role map. When `company` is set, usernames must end with `-<company>` or `-ext`.


<details><summary>Invite members</summary>

```hcl
organization_parameters = {
  enable = true
  billing_email = "billing@example.com"
  company       = "Example"
  users = {
    "user1-example"  = "member"
    "admin1-example" = "admin"
  }
}
```


</details>


### Organization Webhooks
Creates `github_organization_webhook` entries for event delivery to external systems. Secrets should be provided via secure variable injection, not committed plaintext.


<details><summary>Webhook skeleton</summary>

```hcl
organization_parameters = {
  enable = true
  billing_email = "billing@example.com"
  webhooks = {
    "notifications" = {
      events = ["push", "pull_request"]
      active = true
      configuration = {
        url          = "https://hooks.example.com/github"
        content_type = "json"
        secret       = "replace-me"
        insecure_ssl = false
      }
    }
  }
}
```


</details>




## 📑 Inputs
| Name                                                         | Description                                                                  | Type          | Default | Required |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------- | ------------- | ------- | -------- |
| enable                                                       | Enables management of organization settings                                  | `bool`        | `false` | no       |
| billing_email                                                | Billing email for the organization                                           | `string`      | `null`  | yes      |
| company                                                      | Company name shown on the organization profile                               | `string`      | `null`  | no       |
| email                                                        | Public contact email                                                         | `string`      | `null`  | no       |
| location                                                     | Organization location                                                        | `string`      | `null`  | no       |
| name                                                         | Display name for the organization                                            | `string`      | `null`  | no       |
| description                                                  | Organization description                                                     | `string`      | `null`  | no       |
| blog                                                         | Blog or website URL                                                          | `string`      | `null`  | no       |
| has_organization_projects                                    | Enable organization projects                                                 | `bool`        | `true`  | no       |
| has_repository_projects                                      | Enable repository projects                                                   | `bool`        | `true`  | no       |
| default_repository_permission                                | Default member permission on repositories (`read`, `write`, `admin`, `none`) | `string`      | `read`  | no       |
| members_can_create_repositories                              | Allow members to create repositories                                         | `bool`        | `false` | no       |
| members_can_create_public_repositories                       | Allow members to create public repositories                                  | `bool`        | `false` | no       |
| members_can_create_private_repositories                      | Allow members to create private repositories                                 | `bool`        | `false` | no       |
| members_can_create_internal_repositories                     | Allow members to create internal repositories                                | `bool`        | `false` | no       |
| members_can_fork_private_repositories                        | Allow members to fork private repositories                                   | `bool`        | `false` | no       |
| web_commit_signoff_required                                  | Require signoff on web commits                                               | `bool`        | `false` | no       |
| advanced_security_enabled_for_new_repositories               | Enable Advanced Security for new repositories                                | `bool`        | `true`  | no       |
| dependabot_alerts_enabled_for_new_repositories               | Enable Dependabot alerts for new repositories                                | `bool`        | `true`  | no       |
| dependabot_security_updates_enabled_for_new_repositories     | Enable Dependabot security updates for new repositories                      | `bool`        | `true`  | no       |
| dependency_graph_enabled_for_new_repositories                | Enable dependency graph for new repositories                                 | `bool`        | `true`  | no       |
| secret_scanning_enabled_for_new_repositories                 | Enable secret scanning for new repositories                                  | `bool`        | `true`  | no       |
| secret_scanning_push_protection_enabled_for_new_repositories | Enable secret scanning push protection for new repositories                  | `bool`        | `true`  | no       |
| webhooks                                                     | Map of organization webhooks                                                 | `map(object)` | `{}`    | no       |
| users                                                        | Map of username → role (`member` or `admin`)                                 | `map(string)` | `{}`    | no       |







## ⚠️ Important Notes
- **⚠️ Enable Gate:** Set `organization_parameters.enable = true` or the wrapper creates no resources.
- **ℹ️ Provider Owner:** Configure the GitHub provider `owner` to the target organization (see `examples/complete`).
- **🔒 Username Convention:** When `company` is set, usernames must end with `-<company>` (lowercase, spaces removed) or `-ext`.
- **🔒 Webhook Secrets:** Do not commit real webhook secrets; inject them at apply time.



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 