resource "google_sql_database_instance" "default" {
  name             = var.db_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-g1-small" # Use a higher tier for production

    backup_configuration {
      enabled                        = true
      start_time                     = "03:00"
      binary_log_enabled             = true
      location                       = var.region
      point_in_time_recovery_enabled = true
    }

    maintenance_window {
      day  = 7 # Sunday
      hour = 3 # 3 AM UTC
    }

    ip_configuration {
      ipv4_enabled    = false # Prefer private IP for production
      # private_network = var.private_network # Pass your VPC network self_link here

      # If you must allow public IP, restrict to trusted IPs only:
      # authorized_networks {
      #   name  = "office"
      #   value = "YOUR.OFFICE.IP.ADDRESS/32"
      # }
      require_ssl = true
    }
  }
}

resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.default.name
  password = var.db_password
}

resource "google_sql_database" "default" {
  name     = var.db_name
  instance = google_sql_database_instance.default.name
}

output "instance_private_ip" {
  description = "The private IP address of the Cloud SQL instance"
  value       = google_sql_database_instance.default.private_ip_address
}
