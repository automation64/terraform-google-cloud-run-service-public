#
# Shared
#

variable "shared__name" {
  description = "Name seed to be used for naming generated module objects"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__location" {
  description = "Location where resources will be deployed to"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__prefix" {
  description = "Prefix definition for naming generated module objects"
  sensitive   = false
  nullable    = true
  type = object({
    google_cloud_run_service = optional(string)
    google_service_account   = optional(string)
  })
  default = {}
}

variable "shared__labels" {
  description = "Common labels to be applied to all resources"
  sensitive   = false
  nullable    = true
  type        = map(string)
  default     = {}
}

variable "shared__project_id" {
  description = "GCP Project ID where resources will be deployed to"
  sensitive   = false
  nullable    = false
  type        = string
}

#
# Google Cloud Run Service
#

variable "google_cloud_run_service" {
  description = "GCP Cloud Run Service attributes"
  sensitive   = false
  nullable    = true
  type = object({
    description         = optional(string)
    deletion_protection = optional(bool, true)
  })
  default = {}
}

variable "google_cloud_run_service__template" {
  description = "GCP Cloud Run Service Template attributes"
  sensitive   = false
  nullable    = false
  type = object({
    revision                         = optional(string)
    timeout                          = optional(string)
    max_instance_request_concurrency = optional(number)
    session_affinity                 = optional(bool)
    scaling = optional(object({
      min_instance_count = optional(number, 0)
      max_instance_count = optional(number, 5)
    }))
  })
  default = {
    scaling = {
      min_instance_count = 0
      max_instance_count = 5
    }
  }
}
