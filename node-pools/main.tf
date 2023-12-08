resource "google_service_account" "kubernetes" {
  account_id = var.k8s-acc-id 
}


resource "google_container_node_pool" "general" {
  name       = var.nodepool-n1 
  cluster    = var.cluster
  location = "asia-south1-a"

  node_count = 3

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }


  node_config {
    preemptible  = false
    machine_type = var.machine-type 
    disk_size_gb = 50



    labels = {
      role = var.role-lbl 
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

/* resource "google_container_node_pool" "spot" {
  name    = var.nodepool-n2 
  cluster = var.cluster
  location = "asia-south1-a"


  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = var.m-type 

    labels = {
      team = var.team-lbl 
    }

    taint {
      key    = var.taint-key 
      value  = var.taint-value 
      effect = var.taint-eff 
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}   */

