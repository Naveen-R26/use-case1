variable "k8s-acc-id" {
  type = string
  description = "kubernetes account id "
}
variable "nodepool-n1" {
  type = string
  description = "node pool name for 1st pool"
}
variable "machine-type" {
  type = string
  description = "machine type for the node pool"
}
variable "role-lbl" {
    type = string
    description = "label for the 1st node "
}
variable "nodepool-n2" {
  type = string
  description = "node name for 2nd node"
}
variable "m-type" {
  type = string
  description = "machinetype for node 2"
}
variable "team-lbl" {
  type = string
  description = "label for 2nd node"
}
variable "taint-key" {
    type = string
    description = "taint key for the node pool" 
}
variable "taint-value" {
  type = string
  description = "taint value for the node pool"
}
variable "taint-eff" {
  type = string
  description = "taint effect for the nodepool type of effect"
}