resource "google_container_cluster" "default" {
  name = var.name_in
  project = var.project_in
  description = "For the apollo task"
  location = var.location_in
  remove_default_node_pool = true
  initial_node_count = var.initial_node_count_in

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }
}
