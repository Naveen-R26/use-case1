module "network" {
  source = "./network"
  my-storage-buck = var.my_storage_buck 
  storage-loc = var.storage_loc
  storage-cls = var.storage_cls 
  bucket-pref = var.bucket_pref 
  vpc-name = var.vpc_name
  routing-mode = var.routing_mode
  Subnet-name = var.Subnet_name
  subnet-range = var.subnet_range
  region-name = var.region_name
  pod-name = var.pod_name
  pod-range = var.pod_range
  service-name = var.service_name
  service-range = var.service_range
  Firewall-name = var.Firewall_name
  proto-type = var.proto_type
  protocol-type  = var.protocol_type
  port-num = var.port_num
  source-range = var.source_range
  router-name = var.router_name
  router-region  = var.router_region
  nat-name = var.nat_name
  nat-region = var.nat_region
  source-ip-nat = var.source_ip_nat
  nat-alloc-ip = var.nat_alloc_ip
  source-ip-type = var.source_ip_type
  nat-add-type = var.nat_add_type
  nat-net-tier = var.nat_net_tier

}
module "kubernetes" {
  source = "./kubernetes"
  cluster-name = var.cluster_name
  cluster-loc = var.cluster_loc
  cluster-netmode = var.cluster_netmode
  node-loc = var.node_loc
  relese-ch = var.relese_ch
  work-pool = var.work_pool
  master-ip = var.master_ip
 network1 = module.network.network-name
 subnetwork1 = module.network.subnetwork-name
}

module "nodepools" {
  
  source = "./node-pools"
  k8s-acc-id = var.k8s_acc_id
  nodepool-n1 = var.nodepool_n1
  machine-type = var.machine_type 
  role-lbl = var.role_lbl
  nodepool-n2 = var.nodepool_n2
  m-type = var.m_type
  team-lbl = var.team_lbl 
  taint-key = var.taint_key
  taint-value = var.taint_value 
  taint-eff = var.taint_eff
  
}