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

  # Habilitar asignación de IPs privadas para Google
  private_ip_google_access = true
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

# Crear el Cluster de GKE privado
resource "google_container_cluster" "vivaldiCluster" {
  name               = "vivaldi-cluster"
  location           = "us-east1-b"
  initial_node_count = 3

  network    = google_compute_network.ClusterTestVPC.name
  subnetwork = google_compute_subnetwork.ClusterTestSubnet.name

  # Versión específica de Kubernetes
  min_master_version = "1.28.3-gke.1023000" # Puedes cambiar por la versión que desees

  private_cluster_config {
    enable_private_nodes    = true  # Los nodos no tienen IP pública
    enable_private_endpoint = false # Permite acceder al API server por IP pública (opcional)
    master_ipv4_cidr_block  = "172.16.0.0/28" # Rango reservado para el master (puedes ajustar este rango)
  }

  # Configuración del nodo
  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  # Habilitar acceso a las API necesarias desde los nodos (DNS, GCR, etc.)
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  # Evitar creación automática de redes secundarias (opcional, depende del diseño)
  remove_default_node_pool = true

  # Crear node pool administrado
  node_pool {
    name       = "default-node-pool"
    node_count = 3

    node_config {
      machine_type = "e2-medium"
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }

    management {
      auto_repair  = true
      auto_upgrade = true
    }
  }
}

# Rango secundario para pods y servicios (requerido para IP aliasing en GKE privado)
resource "google_compute_subnetwork" "ClusterTestSubnet_with_ranges" {
  name          = "Cluster-Test-Subnet"
  region        = "us-east1-b"
  network       = google_compute_network.ClusterTestVPC.name
  ip_cidr_range = "10.0.0.0/24"

  # Rangos secundarios
  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.2.0.0/20"
  }

  private_ip_google_access = true
}
