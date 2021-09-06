resource "google_container_node_pool" "default" {
  name = "${var.name_in}-node-pool"
  project = var.project_in
  location = var.location_in
  cluster = var.cluster_name_in
  initial_node_count = 3
  node_config {
    preemptible = true
    machine_type = var.machine_type_in
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
  # # Configuration required by cluster autoscaler to adjust the size of the node pool to the current cluster usage.
  autoscaling {
    # Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count.
    min_node_count = 1

    # Maximum number of nodes in the NodePool. Must be >= min_node_count.
    max_node_count = 3
  }
  # Node management configuration, wherein auto-repair and auto-upgrade is configured.
  management {
    # Whether the nodes will be automatically repaired.
    auto_repair = true

    # Whether the nodes will be automatically upgraded.
    auto_upgrade = true
  }
}
