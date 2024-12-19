resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "primary_vm" {
  name         = "primary-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["postgres"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
      size  = 10
      type  = "pd-balanced"
    }
  }

 

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork-1.name
    # access_config {
    #   // Ephemeral public IP
    # }
  }

  metadata = {
    foo = "bar"
    
  }

   

  
  metadata_startup_script = file("${path.root}/${var.script_name1}")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_instance" "replica_vm" {
  name         = "replica-instance"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  tags = ["postgres"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
      size  = 10
      type  = "pd-balanced"
    }
  }

 

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork-2.name
    # access_config {
    #   // Ephemeral public IP
    # }
  }

  metadata = {
    foo = "bar"
    
  }

   

  
  metadata_startup_script = file("${path.root}/${var.script_name1}")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}