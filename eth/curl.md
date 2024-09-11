# Curl


curl -v (--verbose)

escapar los corchetes con %5B para [ y %5D para ]

Incorrecto

    curl -v http://internal-api-organization.abc/king/prod/alertas/[Flaco] Read ssh information/escalation-policies  

Correcto

    curl -v http://internal-api-organization.abc/king/prod/alert-types/%5BFlaco%5D%20Read%20ssh%20information/escalation-policies


Se pueden ver cabeceras

    X-Content-Type-Options: nosniff
    X-Request-ID:
    X-Frame-Options: DENY
    X-XSS-Protection: 1; mode=block
    X-Nginx-Host:
    X-Nginx-Pool:
    X-Nginx-UpstreamHost:
    X-Upstream-Server: envoy


Incluir encabezados en la respuesta

    curl -i (Incluir encabezados en la respuesta)


Mostrar el tiempo de conexión y otras métricas con -w


https://gist.github.com/subfuzion/08c5d85437d5d4f00e58


