resource "google_cloud_run_service" "default" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/${var.image}:${var.image_tag}"
        env {
          name  = "DB_CONNECTION"
          value = "postgres://${var.db_user}:${var.db_password}@${var.db_host}:5432/${var.db_name}"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service = google_cloud_run_service.default.name
  location = var.region
  role    = "roles/run.invoker"
  member  = "allUsers"
}
