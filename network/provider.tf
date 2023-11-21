provider "google" {
  project = "enhanced-kit-397503" #ur project id
  region  = "asia-south1"
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.6.0"
    }
  }
}
  

