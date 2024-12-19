resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "5432","3389","5433"]
  }

  source_ranges = ["10.0.0.0/16","103.199.226.135/32","35.235.240.0/20"]
  target_tags = ["postgres"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}