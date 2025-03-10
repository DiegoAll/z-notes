# Private cluster

provider "google" {
  project = "vivaldi-cluster"
  region  = "us-east1-b"
}

# Crear la VPC
resource "google_compute_network" "ClusterTestVPC" {
  name                    = "Cluster-Test-VPC"
  auto_create_subnetworks  = false  # No creamos subredes automáticamente
}

# Crear la Subnet
resource "google_compute_subnetwork" "ClusterTestSubnet" {
  name          = "Cluster-Test-Subnet"
  region        = "us-east1-b"
  network       = google_compute_network.ClusterTestVPC.name
  ip_cidr_range = "10.0.0.0/24"  # Rango de direcciones IP para la subred
}

# Crear el Cluster de GKE
resource "google_container_cluster" "vivaldiCluster" {
  name     = "vivaldi-cluster"
  location = "us-east1-b"
  initial_node_count = 3

  # Configuración de la VPC y Subnet
  network    = google_compute_network.ClusterTestVPC.name
  subnetwork = google_compute_subnetwork.ClusterTestSubnet.name

  node_config {
    machine_type = "e2-medium"
  }
}
