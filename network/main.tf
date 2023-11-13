#Creating VPC for cluster

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

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
  network                  = google_compute_network.main.id
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
  name         = google_compute_router_nat.nat.self_link
  address_type = var.nat-add-type 
  network_tier = var.nat-net-tier 

  depends_on = [google_project_service.compute]
}




