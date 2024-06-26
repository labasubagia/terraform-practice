output "network_self_link" {
  value = google_compute_network.this.self_link
}

output "service_account_email" {
  value = google_service_account.this.email
}

output "redis_ip_secret_id" {
  value = google_secret_manager_secret.redis_ip.secret_id
}
