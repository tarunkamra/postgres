resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
  auto_create_subnetworks = false
  project = "electric-unity-395307"
}

resource "google_compute_subnetwork" "subnetwork-1" {
  provider                = google-beta
  name                    = "subnetwork-1"
  region                  = "us-central1"
  network                 = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.0.0/24"
  private_ip_google_access = true
  depends_on = [ google_compute_network.vpc_network ]
  project = "electric-unity-395307"
}

resource "google_compute_subnetwork" "subnetwork-2" {
    provider                = google-beta
    name                    = "subnetwork-2"
    region                  = "us-east1"
    network                 = google_compute_network.vpc_network.id
    ip_cidr_range = "10.0.1.0/24"
    private_ip_google_access = true
    depends_on = [ google_compute_network.vpc_network ]
    project = "electric-unity-395307"
}

