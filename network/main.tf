#Enabling required API,s

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}
resource "google_project_service" "storage" {
  service = "storage.googleapis.com"
}

/*#Creating An Bucket to store tfstate file
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "my-bucket" {
  name          = var.my-storage-buck 
  force_destroy = false
  location      = var.storage-loc 
  storage_class = var.storage-cls 
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.terraform_state_bucket.id
  }
  depends_on = [
    google_project_iam_member.default
  ]
}
terraform {
 backend "gcs" {
   bucket  = google_storage_bucket.my-storage-buck.name
   prefix  = var.bucket-pref 
 }
}*/

#Creating VPC for cluster
resource "google_compute_network" "main" {
  name                            = var.vpc-name
  routing_mode                    = var.routing-mode
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

#Creating Subnet for Cluster

resource "google_compute_subnetwork" "private" {
  name                     = var.Subnet-name
  ip_cidr_range            = var.subnet-range
  region                   = var.region-name
  network                  = google_compute_network.main.name
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod-name
    ip_cidr_range = var.pod-range
  }

  secondary_ip_range {
    range_name    = var.service-name
    ip_cidr_range = var.service-range 
  }
}

# Creating Firewall for Cluster

resource "google_compute_firewall" "allow-ssh" {
  name    = var.Firewall-name 
  network = google_compute_network.main.name

  allow {
    protocol = var.proto-type 
  }

  allow {
    protocol = var.protocol-type 
    ports    = var.port-num
  }

  source_ranges = [var.source-range]
}

#Creating Router for cluster

resource "google_compute_router" "router" {
  name    = var.router-name
  region  = var.router-region 
  network = google_compute_network.main.id
}

#Creating NAT for cluster

resource "google_compute_router_nat" "nat" {
  name   = var.nat-name 
  router = google_compute_router.router.name
  region = var.nat-region 

  source_subnetwork_ip_ranges_to_nat = var.source-ip-nat
  nat_ip_allocate_option             = var.nat-alloc-ip

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = [var.source-ip-type]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = google_compute_router_nat.nat.name
  address_type = var.nat-add-type 
  network_tier = var.nat-net-tier 

  depends_on = [google_project_service.compute]
}




