
provider "google" {
  project = "enhanced-kit-397503" #ur project id
  region  = "asia-south1"
}

terraform {
  backend "gcs" {
    bucket = "naveen-tf-storage" # ur bucket name 
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
