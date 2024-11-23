

resource "google_compute_network" "vpc_network" {
  project                 = "host-project-419903"
  name                    = "pci-dss-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}