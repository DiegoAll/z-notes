# DEMO

## 1.1 LOCAL SSH PORT FORWARD

Tener instalado una base de datos mysql en la instancia de GCP.

*Limpiar conexiones antiguas*

lsof -i:22 | grep ec2 | awk '{print $2}' | xargs -r kill -9
lsof -i:22 | grep ec2


*Desde el pod en EKS*

    1. ssh -i gcp_remote -NL 3306:localhost:3306 diegoposada@34.27.180.215

    2. netstat -tulnp | grep 3306 (Otra terminal del mismo pod, Validar conexión del tunel establecido )

    3. mysql -h 127.0.0.1 -u user -P 3306 -p test
    mysql -h 127.0.0.1 -u user -P 3306 -p test -e "SHOW VARIABLES LIKE 'socket';"

    mysql -h 127.0.0.1 -u root -P 3306 -p test


*Desde la instancia GCE*

    1. tcpdump -i any port 3306 -nn -v

    2. docker exec -it mysql-server mysql -u root -p
    
    SHOW PROCESSLIST;


## 1.2 REMOTE SSH PORT FORWARD


Tener instalado nginx en el pod de EKS.

*Limpiar conexiones antiguas*

lsof -i:22 | grep ec2 | awk '{print $2}' | xargs -r kill -9
lsof -i:22 | grep ec2

*Desde el pod en EKS*

    1. netstat -tulnp | grep 80 && netstat -tulnp | grep 81

    2. ssh -i gcp_remote -R 8080:127.0.0.1:80 diegoposada@34.27.180.215
       ssh -i gcp_remote -R 8081:127.0.0.1:81 diegoposada@34.27.180.215

    3. curl http://localhost:80 ; curl http://localhost:81/nginx_status


Nota: Para visualizar el estado de nginx se dispone de una configuración adicional (stub_status: /nginx_status)


*Desde la instancia GCE*

    1. netstat -tulnp | grep 8081 && netstat -tulnp | grep 8080  (Validar conexión del tunel establecido)

    2. curl http://localhost:80 ; curl http://localhost:81/nginx_status



## PRIVILEGE ESCALATION

Coming soon (Agosto 2024)



## HUNTING

Coming soon (Agosto 2024)

HONESTOS: 
v0.33 reglas vendor = 75
Baseline (enable) = 38  (Aun hay ruido)

(38 / 75) * 100 = 50.67


## SUPPLY CHAIN




## RCE 

metasploit + interactive upgrade + vuln machine + Diego secure code falco trin + ngrok



## Container Escapes



## (...)



## Container drift (AYUDA)