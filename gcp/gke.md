# Google Kubernetes Engine


> GKE Public cluster | GKE Private cluster


Standard|Autopilot Cluster



Para crear un cluster:

Habilitar la API de contenedores

gcloud services enable container.googleapis.com --project $PROJECT_ID
gcloud services enable cloudtrace.googleapis.com --project $PROJECT_ID
gcloud services enable cloudtrace.googleapis.com --project $PROJECT_ID
gcloud services enable clouddebugger.googleapis.com --project $PROJECT_ID
gcloud services enable cloudprofiler.googleapis.com --project $PROJECT_ID

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



### Viabilidad

| Instancia         | vCPU | RAM   | Tipo CPU  | ¿CPU dedicada? | Uso recomendado                                   |
|-------------------|------|-------|-----------|----------------|--------------------------------------------------|
| e2-small          | 0.5  | 2 GB  | Compartida| ❌              | Pruebas, bots, tareas muy ligeras                |
| e2-medium         | 1    | 4 GB  | Compartida| ❌              | Apps ligeras, servicios básicos                 |
| e2-standard-2     | 2    | 8 GB  | Completa  | ✅              | Apps medianas, backend con tráfico moderado    |
| e2-standard-4     | 4    | 16 GB | Completa  | ✅              | Apps más exigentes, bases de datos pequeñas     |


**e2-medium**: Sí, es viable para ciertos escenarios, pero con limitaciones que debes considerar según la carga de trabajo del cluster.

**Ventajas**: Bajo costo, suficiente para microservicios sencillos, escalado flexible.

**Limitaciones y riesgos**: 

* CPU compartida (no garantizada):

* En momentos de alta demanda en la zona o nodo, Google puede reducir la CPU disponible a tus instancias.
Esto impacta directamente la latencia y desempeño de tus pods.


Si tienes APIs críticas, workloads intensivos o latencia sensible, NO es recomendable.
Problemas típicos: pods lentos, timeouts, cuellos de botella.
Menos memoria (4 GB):

En clusters donde los pods requieren más memoria (por ejemplo, apps Java, bases de datos, o servicios de IA), se quedará corto.

**Falco**

🔑 Consideraciones específicas para Falco:
Falco es un DaemonSet → 1 pod por nodo.
Cada agente de Falco va a consumir recursos continuamente, ya que está analizando eventos del kernel (syscalls).
Aunque Falco no consume excesiva CPU o RAM, sí necesita estabilidad, porque debe reaccionar rápido a eventos (detección en tiempo real).


| **Requisito**                                          | **Riesgo con e2-medium**                                                                                             |
|--------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| CPU estable para syscalls continuos                    | CPU compartida → puede provocar retrasos en la detección de amenazas si hay otros pods consumiendo recursos.         |
| Memoria adecuada para Falco y sus buffers              | Con 4 GB por nodo, debes contar cuánto RAM consumen tus apps y Falco. En clústeres con apps exigentes, puede quedarse corto. |
| Latencia mínima en detección                           | Si hay contention por CPU, puede afectar la velocidad con la que Falco analiza los eventos.                           |





## References


https://cloud.google.com/compute/docs/general-purpose-machines?hl=es-419



# 

      check-autopilot-compatibility  Check autopilot compatibility of a running
                                     cluster.
      create                         Create a cluster for running containers.
      create-auto                    Create an Autopilot cluster for running

      upgrade                        Upgrade the Kubernetes version of an
                                existing container cluster.


    gcloud services enable compute.googleapis.com
    gcloud services enable container.googleapis.com

    gcloud container clusters list