resource "google_compute_global_address" "default" {
  name = "lb-ip"
}

resource "google_compute_region_network_endpoint_group" "run_neg" {
  name                  = "${var.service_name}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = var.service_name
  }
}

resource "google_compute_backend_service" "default" {
  name                            = "${var.service_name}-backend"
  load_balancing_scheme           = "EXTERNAL"
  protocol                        = "HTTP"
  enable_cdn                      = false
  backend {
    group = google_compute_region_network_endpoint_group.run_neg.id
  }
}

resource "google_compute_url_map" "default" {
  name            = "${var.service_name}-urlmap"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name   = "${var.service_name}-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "${var.service_name}-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}
