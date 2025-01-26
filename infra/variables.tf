###### varialbes.tf ######

variable "branch_name" {
    description = "The Github branch name"
    type        = string
}

variable "github_run_id" {
  description = "GitHub run ID"
  type        = string
}

variable "project" {
    description = "The GCP project ID"
    type        = string
}

variable "region" {
    description = "The GCP region"
    type        = string
}

variable "zone" {
    description = "The GCP zone"
    type        = string
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "disk_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
}


variable "network" {
  description = "The network for the VM instance"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork for the VM instance"
  type        = string
}

variable "image_family" {
  description = "The image family for the VM instance"
  type        = string
}

variable "image_project" {
  description = "The image project for the VM instance"
  type        = string
}

variable "boot_disk_size" {
  description = "The boot disk size for the VM instance"
  type        = string
}

variable "boot_disk_type" {
  description = "The boot disk type for the VM instance"
  type        = string
}

variable "service_account_email" {
  description = "The service account email for the VM instance"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}  # Set default to empty map if appropriate
}