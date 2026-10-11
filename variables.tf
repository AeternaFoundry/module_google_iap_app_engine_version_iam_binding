variable "iap_app_engine_version_iam_bindings" {
  description = <<EOT
Map of iap_app_engine_version_iam_bindings, attributes below
Required:
    - app_id
    - members
    - role
    - service
    - version_id
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    app_id     = string
    members    = set(string)
    role       = string
    service    = string
    version_id = string
    project    = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

