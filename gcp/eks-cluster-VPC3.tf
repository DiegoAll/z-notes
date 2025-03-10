provider "google" {
  project = "vivaldi-cluster"
  region  = "us-east1-b"
}

# Crear la VPC
resource "google_compute_network" "ClusterTestVPC" {
  name                    = "Cluster-Test-VPC"
  auto_create_subnetworks = false
}

# Crear la Subnet
resource "google_compute_subnetwork" "ClusterTestSubnet" {
  name          = "Cluster-Test-Subnet"
  region        = "us-east1-b"
  network       = google_compute_network.ClusterTestVPC.name
  ip_cidr_range = "10.0.0.0/24"
}

# Crear el Router necesario para Cloud NAT
resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  network = google_compute_network.ClusterTestVPC.name
  region  = "us-east1-b"
}

# Configurar Cloud NAT para permitir egress a internet
resource "google_compute_router_nat" "nat_config" {
  name                               = "nat-config"
  router                             = google_compute_router.nat_router.name
  region                             = "us-east1-b"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# Crear el Cluster de GKE
resource "google_container_cluster" "vivaldiCluster" {
  name               = "vivaldi-cluster"
  location           = "us-east1-b"
  initial_node_count = 3

  network    = google_compute_network.ClusterTestVPC.name
  subnetwork = google_compute_subnetwork.ClusterTestSubnet.name

  node_config {
    machine_type = "e2-medium"
  }
}
