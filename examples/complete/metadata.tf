locals {
  metadata = {
    environment   = "Laboratory"
    github_owner  = "example-org"

    key = {
      company = "dmc"
      env     = "lab"
      layer   = "organization"
    }
  }

  common_name_prefix = join("-", [
    local.metadata.key.company,
    local.metadata.key.env
  ])

  common_name = local.common_name_prefix
}
