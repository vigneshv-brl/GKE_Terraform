variable "name" {
  default = "apollo-cluster"
}

variable "project" {
  default = "apollotask-322117"
}

#this setting will ensure its a zonal cluster https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#location
variable "location" {
  default = "us-central1-c"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"
}
