output "load_balancer_ip" {
  description = "The global IP address of the load balancer."
  value       = google_compute_global_address.default.address
} 