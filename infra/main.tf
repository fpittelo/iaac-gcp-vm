##### GITHUB Branch #############

##### VM Instance Creation ######

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
    device_name = var.disk_name
  }

  labels = {
    git           = var.git_branch
    project       = var.project
    dpt           = "it"
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata = {
    ssh-keys = "user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3..."
  }
}
