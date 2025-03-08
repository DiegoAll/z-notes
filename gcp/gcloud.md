# gcloud SDK

    gcloud config get-value account
    gcloud config list
    gcloud auth list

    gcloud auth login --account=tu_primer_email@gmail.com

    https://accounts.google.com/o/oauth2/auth?
    response_type=code
    &client_id=CLIENT_ID
    &redirect_uri=REDIRECT_URI
    &scope=openid+SCOPE_1+SCOPE_2+SCOPE_N
    &state=STATE_VALUE
    &access_type=offline
    &code_challenge=CODE_CHALLENGE
    &code_challenge_method=S256     (Redirects to the browser)

**Sign in to Google Cloud SDK**
**You are now authenticated with the gcloud CLI!**

    gcloud config set account email@gmail.com  (Cambiar de cuenta manualmente)

Configurar perfiles con diferentes cuentas  (LUEGO)

    gcloud config configurations create cuenta1
    gcloud config configurations create cuenta2

Asigna una cuenta a cada configuración: (LUEGO)

    gcloud config set account tu_primer_email@gmail.com --configuration cuenta1
    gcloud config set account tu_segundo_email@gmail.com --configuration cuenta2

Cambiar entre configuraciones  (LUEGO)

    gcloud config configurations activate cuenta1
    gcloud config configurations activate cuenta2

    gcloud components update (Puede tardas unos minutos)
    gcloud config list project
    gcloud config get-value compute/zone   (https://gcping.com/)
    gcloud config set compute/zone us-east1-b (South Carolina)
    gcloud config list
    gcloud compute project-info describe

https://www.googleapis.com/compute/v1/projects/
vmDnsSetting: ZONAL_ONLY
xpnProjectStatus: UNSPECIFIED_XPN_PROJECT_STATUS


## Compute engine

    gcloud compute instances list
    gcloud compute instances create [INSTANCE_NAME] --zone=[ZONE] --image-family=[IMAGE_FAMILY] --image-project=[IMAGE_PROJECT]
    gcloud compute instances stop [INSTANCE_NAME] --zone=[ZONE]
    gcloud compute instances start [INSTANCE_NAME] --zone=[ZONE]
    gcloud compute instances delete [INSTANCE_NAME] --zone=[ZONE]

## GKE

    gcloud container clusters list
    gcloud container clusters get-credentials [CLUSTER_NAME] --zone [ZONE] --project [PROJECT_ID]

## Cloud Storage

    gcloud storage buckets list
    gcloud storage cp [LOCAL_FILE_PATH] gs://[BUCKET_NAME]/[OBJECT_NAME]
    gcloud storage cp gs://[BUCKET_NAME]/[OBJECT_NAME] [LOCAL_FILE_PATH]
    gcloud storage buckets delete gs://[BUCKET_NAME]

## IAM

    gcloud iam service-accounts list
    gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_EMAIL]" --role="roles/[ROLE]"

##  Google Cloud Functions

    gcloud functions list
    gcloud functions deploy [FUNCTION_NAME] --runtime [RUNTIME] --trigger-http
    gcloud functions call [FUNCTION_NAME]

## Google Cloud SQL

    gcloud sql instances list
    gcloud sql instances create [INSTANCE_NAME] --tier=db-f1-micro --region=[REGION]
    gcloud sql connect [INSTANCE_NAME] --user=[USER]


## Logs y auditoría

    gcloud logging read "resource.type=gce_instance" --limit 10 --order by timestamp desc (Ver los logs de una instancia de Compute Engine:)
    gcloud functions logs read  (Ver los logs de Cloud Functions)


## Administrar servicios de Google Cloud

    gcloud services list     (Ver las APIs habilitadas en tu proyecto)
    gcloud services enable [API_NAME]      (Habilitar una API)
    gcloud services disable [API_NAME]    (Deshabilitar una API)

## Desplegar aplicaciones 
















