module "kcluster" {
  source = "./k8sCluster"
  name_in = var.name
  project_in = var.project
  location_in = var.location
  initial_node_count_in = var.initial_node_count
}


module "knodepool" {
  source = "./k8sNodepool"
  cluster_name_in = module.kcluster.kclustername
  name_in = var.name
  project_in = var.project
  location_in = var.location
  machine_type_in = var.machine_type
}
