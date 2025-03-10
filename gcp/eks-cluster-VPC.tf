provider "google" {
  project = "tu-proyecto"
  region  = "us-east1-b"
}

resource "google_container_cluster" "vivaldi-cluster" {
  name     = "vivaldi-cluster"
  location = "us-east1-b"
  initial_node_count = 3

  # Configuración de VPC y Subnet
  network    = "projects/tu-proyecto/global/networks/tu-vpc"      # Nombre de la VPC
  subnetwork = "projects/tu-proyecto/regions/us-east1/subnetworks/tu-subnet"  # Nombre de la Subnet

  node_config {
    machine_type = "e2-medium"
  }
}
