resource "google_compute_router" "router" {
  project = var.project
  name    = "nat-router"
  network = google_compute_network.vpc_network.name
  region  = "us-central1"
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "my-router-nat"
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = "AUTO_ONLY"


  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnetwork-1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

resource "google_compute_router" "router2" {
  project = var.project
  name    = "nat-router-2"
  network = google_compute_network.vpc_network.name
  region  = "us-east1"
}

resource "google_compute_router_nat" "nat_manual2" {
  name   = "my-router-nat-2"
  router = google_compute_router.router2.name
  region = google_compute_router.router2.region

  nat_ip_allocate_option = "AUTO_ONLY"


  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnetwork-2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}