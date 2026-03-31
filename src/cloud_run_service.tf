resource "google_cloud_run_v2_service" "main" {
  location            = var.shared__location
  description         = var.google_cloud_run_service.description
  project             = var.shared__project_id
  deletion_protection = var.google_cloud_run_service.deletion_protection

  name                 = local.google_cloud_run_service.name
  labels               = local.google_cloud_run_service.labels
  ingress              = local.google_cloud_run_service.ingress
  default_uri_disabled = local.google_cloud_run_service.default_uri_disabled
  iap_enabled          = local.google_cloud_run_service.iap_enabled

  template {
    revision         = var.google_cloud_run_service__template.revision
    timeout          = var.google_cloud_run_service__template.timeout
    session_affinity = var.google_cloud_run_service__template.session_affinity

    scaling {
      min_instance_count = var.google_cloud_run_service__template.scaling.min_instance_count
      max_instance_count = var.google_cloud_run_service__template.scaling.max_instance_count
    }

    containers {
      image = local.google_cloud_run_service__template.containers.image
    }

    labels                = local.google_cloud_run_service__template.labels
    execution_environment = local.google_cloud_run_service__template.execution_environment
  }
}
