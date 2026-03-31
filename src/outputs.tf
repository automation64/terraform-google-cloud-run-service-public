#
# Google Cloud Run Service
#

output "google_cloud_run_service" {
  value       = google_cloud_run_v2_service.main
  description = "GCP Cloud Run Service"
  sensitive   = false
}

#
# Google Service Account
#

output "google_service_account" {
  value       = google_service_account.main
  description = "GCP Service Account"
  sensitive   = false
}

output "google_cloud_run_service_iam_policy" {
  value       = google_cloud_run_service_iam_policy.noauth
  description = "GCP Cloud Run Service IAM Policy"
  sensitive   = false
}
