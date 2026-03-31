resource "google_service_account" "main" {
  project = var.shared__project_id

  account_id                   = local.google_service_account.account_id
  display_name                 = local.google_service_account.description
  disabled                     = local.google_service_account.disabled
  create_ignore_already_exists = local.google_service_account.create_ignore_already_exists
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_v2_service.main.location
  project  = google_cloud_run_v2_service.main.project
  service  = google_cloud_run_v2_service.main.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
