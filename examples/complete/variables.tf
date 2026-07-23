/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

# variable "metadata" {
#   type = any
# }

/*----------------------------------------------------------------------*/
/* Organization | Variable Definition                                   */
/*----------------------------------------------------------------------*/

variable "organization_parameters" {
  type        = any
  description = "Map of settings for the GitHub organization (settings, users, webhooks)."
  default     = {}
}

variable "organization_defaults" {
  type        = any
  description = "Default values merged into organization_parameters."
  default     = {}
}
