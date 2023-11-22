/*my-storage-buck = "my-bucket-tfstate"
storage-loc = "US"
storage-cls = "STANDARD"
bucket-pref = "terraform/state"
vpc-name = "main"
routing-mode = "REGIONAL"
Subnet-name = "private"
subnet-range = "10.0.0.0/18"
region-name = "asia-south1"
pod-name = "k8s-pod-range"
pod-range = "10.48.0.0/14"
service-name = "k8s-service-range"
service-range = "10.52.0.0/20"
Firewall-name = "allow-ssh"
proto-type  = "icmp"
protocol-type = "tcp"
port-num = ["22","80","8080","1000-2000"]
source-range = "0.0.0.0/0"
router-name = "router"
router-region = "asia-south1"
nat-name = "nat"
nat-region  = "asia-south1"
source-ip-nat = "LIST_OF_SUBNETWORKS"
nat-alloc-ip = "MANUAL_ONLY"
source-ip-type = "ALL_IP_RANGES"
nat-add-type = "EXTERNAL"
nat-net-tier = "PREMIUM"*/

output "network-name"{
    value = google_compute_network.main.name
}
output "subnetwork-name" {
  value = google_compute_subnetwork.private.name
}