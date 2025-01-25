terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.17.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone

  credentials = file("/home/runner/work/google_vm/google_vm/gha-creds-${var.github_run_id}.json")
}