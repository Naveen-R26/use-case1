/*cluster-name = "primary"
cluster-loc = "asia-south1-a"
cluster-netmode = "VPC_NATIVE"
node-loc = "asia-south1-b"
relese-ch  = "REGULAR"
work-pool = "enhanced-kit-397503.svc.id.goog"
master-ip = "172.16.0.0/28"*/

output "cluster" {
  value = google_container_cluster.primary.name
}