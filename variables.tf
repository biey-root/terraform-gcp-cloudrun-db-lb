variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources in"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone to deploy resources in"
  type        = string
  default     = "us-central1-a"
}

variable "db_name" {
  description = "The name of the Cloud SQL database instance"
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service and related resources"
  type        = string
}

variable "db_user" {
  description = "The database user name for Cloud SQL"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "The database user password for Cloud SQL"
  type        = string
  default     = "strong-password"
  sensitive   = true
}

variable "image" {
  description = "The name of the container image (without tag) to deploy to Cloud Run."
  type        = string
}

variable "image_tag" {
  description = "The tag of the container image to deploy to Cloud Run."
  type        = string
  default     = "latest"
}

