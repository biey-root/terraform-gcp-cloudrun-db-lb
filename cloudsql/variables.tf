variable "region" {
  description = "The GCP region."
  type        = string
}

variable "db_name" {
  description = "The name of the database instance."
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

variable "project_id" {
  description = "The GCP project ID (optional, not currently used)."
  type        = string
  default     = ""
} 