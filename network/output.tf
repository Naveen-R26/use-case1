output "network-name"{
    value = google_compute_network.main.name
}
output "subnetwork-name" {
  value = google_compute_subnetwork.private.name
}
