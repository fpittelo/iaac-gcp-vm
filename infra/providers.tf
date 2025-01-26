terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.17.0"
    }
  }
  backend "gcs" {
    bucket = "gothic-province-448810-q2-terraform"
    prefix = "backend/terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone

  access_token = data.google_client_openid_connect_access_token.default.token
}

data "google_client_openid_connect_access_token" "default" {
  target_audience = "https://accounts.google.com/o/oauth2/auth"
}