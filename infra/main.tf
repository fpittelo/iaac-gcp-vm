##### GITHUB Branch #############

resource "null_resource" "git_branch" {
  provisioner "local-exec" {
    command = "git rev-parse --abbrev-ref HEAD"
    environment = {
      GIT_TERMINAL_PROMPT = "0" 
    }
  }
}

output "git_branch_name" {
  value = null_resource.git_branch.provisioner.local-exec.0.stdout
}

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
     deployment_branch = module.git_branch.git_branch_name
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
