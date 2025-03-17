# Authentication



1. Autenticación con usuario

La sesión dura 1 hora por defecto.
Sin embargo, gcloud usa un refresh token, lo que significa que la sesión puede renovarse automáticamente mientras se sigan haciendo solicitudes.
La sesión solo expira completamente si revocas manualmente las credenciales con:

    gcloud auth login <User>
    gcloud auth revoke


2. Autenticacion con (Application Default Credentials - ADC)

Similar a la autenticación estándar, los tokens duran 1 hora, pero gcloud los renueva automáticamente cuando es necesario.
Se usa para autenticación en aplicaciones que ejecutan en Google Cloud o de forma local.

    gcloud auth application-default login



3. Autenticación con Cuentas de Servicio

Los tokens de acceso duran 1 hora.
Sin embargo, si la cuenta de servicio está configurada correctamente, el SDK renueva automáticamente los tokens cuando expiran.


    gcloud auth activate-service-account
    gcloud auth list
    gcloud auth application-default print-access-token




