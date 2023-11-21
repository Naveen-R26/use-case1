variable "my-storage-buck" {
  type = string
  description = "bucket name"
}
variable "storage-loc" {
  
}
variable "storage-cls" {
  
}
variable "bucket-pref" {
  
}


variable "vpc-name" {
  type = string
  description = "name of the vpc"
}
variable "routing-mode" {
  type = string
  description = "routing mode"
}
variable "Subnet-name" {
    type = string
    description = "name of the subnet"
}
variable "subnet-range" {
    type = string
    description = "cide range for subnet "
}
variable "region-name" {
    type = string
    description = "region for subnet"
}
variable "pod-name" {
    type = string
    description = "name for pod"
}
variable "pod-range" {
    type = string
    description = "ip range for pod" 
}
variable "service-name" {
    type = string
    description = "name for service"
}
variable "service-range" {
    type = string
    description = "ip range for service"
}
variable "Firewall-name" {
  type = string
  description = "firewall name "
}
variable "proto-type" {
  type = string
  description = "protocol type "
}
variable "protocol-type" {
  type = string
  description = "protocol type"
}
variable "port-num" {
  type = list(string)
  description = "port number for protocol"
}
variable "source-range" {
    type = string
    description = "open source range" 
}
variable "router-name" {
  type = string
  description = "name of the router "
}
variable "router-region" {
  type = string
  description = "router region for cluster"
}
variable "nat-name" {
  type = string
  description = "name for nat gateway"
}
variable "nat-region" {
  type = string
  description = "nat region"
}
variable "source-ip-nat" {
  type = string
  description = "source ip ranges for nat"
}
variable "nat-alloc-ip" {
  type = string
  description = "nat ip allocation type"
}
variable "source-ip-type" {
    type = string
    description = "subnet source ip ranges"
}
variable "nat-add-type" {
  type = string
  description = "nat address type"
}
variable "nat-net-tier" {
  type = string
  description = "nat neteork tier type"
}