locals {
  #
  # Shared
  #

  shared__labels = {
    at64_shared__automated      = "true"
    at64_shared__module_type    = "terraform"
    at64_shared__module_name    = "terraform-google-cloud-run-service-public"
    at64_shared__module_version = "1-0-0"
  }

  shared__prefix = {
    google_cloud_run_service = coalesce(var.shared__prefix.google_cloud_run_service, module.lib_catalog.pgg.run_service)
    google_service_account   = coalesce(var.shared__prefix.google_service_account, module.lib_catalog.pgg.service_account)
  }

  shared__name_instance = "${var.shared__name}-${format("%04d", random_integer.main.result)}"

  #
  # Google Cloud Run Service
  #

  google_cloud_run_service = {
    name                 = "${local.shared__prefix.google_cloud_run_service}-${var.shared__name}"
    ingress              = "INGRESS_TRAFFIC_ALL"
    default_uri_disabled = false
    iap_enabled          = false

    labels = merge(
      local.shared__labels,
      var.shared__labels
    )
  }

  google_cloud_run_service__template = {
    execution_environment = "EXECUTION_ENVIRONMENT_GEN2"

    containers = {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }

    labels = merge(
      local.shared__labels,
      var.shared__labels
    )
  }

  #
  # Google Service Account
  #

  google_service_account = {
    account_id                   = "${local.shared__prefix.google_service_account}-${local.shared__name_instance}"
    description                  = "Dedicated Service Account for Google Cloud Run Service"
    disabled                     = false
    create_ignore_already_exists = false
  }
}
