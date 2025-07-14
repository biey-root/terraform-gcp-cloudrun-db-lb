variable "region" {
  description = "The GCP region."
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "project_id" {
  description = "The GCP project ID (optional, not currently used)."
  type        = string
  default     = ""
} 