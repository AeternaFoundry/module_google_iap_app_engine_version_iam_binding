resource "google_iap_app_engine_version_iam_binding" "iap_app_engine_version_iam_bindings" {
  for_each = var.iap_app_engine_version_iam_bindings

  app_id     = each.value.app_id
  members    = each.value.members
  role       = each.value.role
  service    = each.value.service
  version_id = each.value.version_id
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

