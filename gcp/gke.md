# Google Kubernetes Engine

Para crear un cluster:

1. Consola de Google Cloud (UI Web)
2. gcloud CLI (Línea de comandos)
3. Terraform (Infraestructura como Código)
4. API de GKE (REST o client libraries)

> Cluster HA: (Quorum Formula = (N/2) +1)

1. Consola de Google Cloud (UI Web)

Autopilot (gestionado por Google, menos configuración).
Estándar (control total sobre los nodos).


2. gcloud CLI (Línea de comandos)


- Cluster estandar

    gcloud container clusters create mi-cluster \
    --zone us-central1-c \
    --num-nodes 3 \
    --machine-type e2-medium

- Cluster Autopilot

    gcloud container clusters create-auto mi-cluster \
    --region us-central1

**Autenticarse al cluster**

    gcloud container clusters get-credentials mi-cluster --zone us-central1-c


**Considerations**

1. Mínimo viable (1 nodo) – Solo para pruebas básicas
- 1 nodo worker (máquina en GCE)
- Control plane gestionado por Google

✅ Permite probar despliegues y servicios básicos.

⚠️ No hay alta disponibilidad: si el nodo falla, pierdes los pods y cargas de trabajo.

⚠️ No puedes probar tolerancia a fallos ni balanceo de carga real.

Costo: Más barato (~$25-30/mes con e2-small)

2. Mínimo recomendado (3 nodos) – Buen equilibrio
- 3 nodos worker para distribuir cargas.
- Control plane gestionado por Google (GKE lo mantiene altamente disponible).

✅ Permite simular tolerancia a fallos.

✅ Balanceo de carga entre nodos.

✅ Puedes probar escalado de pods y nodos.

⚠️ Costará más, pero sigue siendo razonable para laboratorios.

Costo: Moderado (~$60-100/mes con e2-medium o e2-standard-2)

3. Alta disponibilidad (5 nodos) – Simulación realista
- 5 nodos worker.
- Ideal para pruebas avanzadas de escalabilidad y disponibilidad.

✅ Puede soportar fallos de 2 nodos sin afectar la operación.

✅ Simulación de entornos de producción.

Costo: Alto (~$150+/mes con e2-standard-4)

https://cloud.google.com/compute/docs/instances?hl=es-419



> Me (Utilice e2-standard-2)

Se va a crear un cluster zonal

Habilitar la API de contenedores que es GKE

    export PROJECT_ID=swift-setup-403505
    gcloud services enable container.googleapis.com --project $PROJECT_ID

Normalmente tarda como unos 30 segundos.
Despues se habilitan APIs adicionales como monitoreo, tracing, debugging etc.

    gcloud services enable monitoring.googleapis.com \
    cloudtrace.googleapis.com \
    clouddebugger.googleapis.com \
    cloudprofiler.googleapis.com \
    --project $PROJECT_ID

    export ZONE=us-east1-b
    gcloud container clusters create trin-cluster --project=$PROJECT_ID --zone=$ZONE --machine-type=e2-standard-2 --num-nodes=3

    Se va a crear un cluster zonal


- Configurar el kubeconfig

kubectl config current-context


e2-small minimo viable  1 nodo
e2-standard-2 o e2-medium  minimo recomendado 3 nodos
e2-standard-4   HA 5 nodos

e2-standard-2 USE ESTA


3. Creación usando Terraform 

**clúster estándar**

Uso del recurso google_container_cluster

Configuración manual de node_config

    provider "google" {
    project = "tu-proyecto"
    region  = "us-central1"
    }

    resource "google_container_cluster" "primary" {
    name     = "mi-cluster"
    location = "us-central1"
    initial_node_count = 3
    node_config {
        machine_type = "e2-medium"
    }
    }

    terraform init
    terraform apply


**Cluster autopilot**

    resource "google_container_cluster" "autopilot" {
    name     = "mi-cluster-autopilot"
    location = "us-central1"
    enable_autopilot = true
    }



4. Creación usando la API de GKE (programaticamente)

    {
    "name": "mi-cluster",
    "initialNodeCount": 3,
    "location": "us-central1",
    "nodeConfig": {
        "machineType": "e2-medium"
    }
    }

    POST https://container.googleapis.com/v1/projects/tu-proyecto/zones/us-central1/clusters



## References


https://cloud.google.com/compute/docs/general-purpose-machines?hl=es-419