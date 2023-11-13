variable "cluster-name" {
  type = string
  description = "name for the cluster"
}
variable "cluster-loc" {
  type = string
  description = "location for the cluster"
}
variable "cluster-netmode" {
    type = string
    description = "cluster networking mode like alias ip"
}
variable "node-loc" {
    type = string
    description = "loacation for nodes "
  
}
variable "relese-ch" {
    type = string
    description = "relese channel for the "
  
}
variable "work-pool" {
  type = string
  description = "work load identity for pool"
}
variable "master-ip" {
  type = string
  description = "master cidr range for private cluster configuration"
}