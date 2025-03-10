    provider "google" {
    project = "tu-proyecto"
    region  = "us-east1-b"
    }

    resource "google_container_cluster" "vivaldi-cluster" {
    name     = "vivaldi-cluster"
    location = "us-east1-b"
    initial_node_count = 3
    node_config {
        machine_type = "e2-medium"
    }
    }

    # terraform init
    # terraform apply



      # Configuración de node pool con autoscaling habilitado
#   node_pool {
#     name       = "default-pool"
#     initial_node_count = 3