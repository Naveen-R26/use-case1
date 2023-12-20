provider "google" {
  project = "naveen-406504" #ur project id
  region  = "asia-south1"
//credentials = file("key.json")
}
terraform {
  backend "gcs" {
    bucket = "terra-tfstate-store"      #ur bucket name pre-created bucket
    prefix = "terraform/state"
  }
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.6.0"
    }
  }
}
  

