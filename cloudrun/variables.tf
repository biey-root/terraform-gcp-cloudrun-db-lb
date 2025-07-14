variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "db_user" {
  description = "The database user."
  type        = string
}

variable "db_password" {
  description = "The database password."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The database name."
  type        = string
}

variable "db_host" {
  description = "The database host (IP or hostname)."
  type        = string
}

variable "image" {
  description = "The name of the container image (without tag) to deploy."
  type        = string
}

variable "image_tag" {
  description = "The tag of the container image to deploy."
  type        = string
  default     = "latest"
} 