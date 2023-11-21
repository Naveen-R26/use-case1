resource "google_container_cluster" "primary" {
  name                     = var.cluster-name 
  location                 = var.cluster-loc 
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network1
  subnetwork               = var.subnetwork1
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = var.cluster-netmode  #Alias ip

  # Optional, if you want multi-zonal cluster
  node_locations = [
     var.node-loc 
  ]

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = var.relese-ch 
  }

  workload_identity_config {
    workload_pool = var.work-pool 
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master-ip 
  }

}