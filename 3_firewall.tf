resource "google_compute_firewall" "default" {
  name    = "frontend-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "443"]
  }

  source_tags = ["web"]
}