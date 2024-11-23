
resource "google_compute_instance" "default" {
  name         = "frontend-web-app"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.network-with-private-secondary-ip-ranges.self_link

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "web"
  }

  metadata_startup_script = "sudo apt install nginx"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "ngfw-448@host-project-419903.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}