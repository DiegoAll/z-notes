# Sysdig (Draios)


Rara que no funcionaba (Dialogo con Bobo italiano de la comunidad)

    root@draios:/home/diegoposada# docker ps
    CONTAINER ID   IMAGE           COMMAND                  CREATED        STATUS        PORTS     NAMES
    4d931ef86c6a   sysdig/sysdig   "/docker-entrypoint.…"   5 months ago   Up 5 months             kind_lumiere
    root@draios:/home/diegoposada# docker exec -it kind_lumiere /bin/bash
    [root@draios /]# csysdig
    error opening device /host/dev/scap0. Make sure you have root credentials and that the scap module is loaded: No such file or directory
    [root@draios /]# sysdig
    Unable to load the driver
    error opening device /host/dev/scap0. Make sure you have root credentials and that the scap module is loaded: No such file or directory

Local si existe /host/dev/scap0

    [root@pho3nix /]# ls -l /host/dev/scap0 
    cr-------- 1 root root 507, 0 Aug 23 00:25 /host/dev/scap0

    root@pho3nix:/home/diegoall# dpkg -l | grep linux-headers
    ii  linux-headers-6.5.0-41-generic                 6.5.0-41.41~22.04.2                               amd64        Linux kernel headers for version 6.5.0 on 64 bit x86 SMP
    ii  linux-headers-6.5.0-45-generic                 6.5.0-45.45~22.04.1                               amd64        Linux kernel headers for version 6.5.0 on 64 bit x86 SMP
    ii  linux-headers-6.8.0-40-generic                 6.8.0-40.40~22.04.3                               amd64        Linux kernel headers for version 6.8.0 on 64 bit x86 SMP
    ii  linux-headers-generic-hwe-22.04                6.8.0-40.40~22.04.3                               amd64        Generic Linux kernel headers

En GCP no aparece

    [root@draios /]# ls -l /host/dev/scap0
    ls: cannot access '/host/dev/scap0': No such file or directory

    root@draios:/home/diegoposada# dpkg -l | grep linux-headers
    ii  linux-headers-6.1.0-18-cloud-amd64    6.1.76-1                       amd64        Header files for Linux 6.1.0-18-cloud-amd64
    ii  linux-headers-6.1.0-18-common         6.1.76-1                       all          Common header files for Linux 6.1.0-18
    ii  linux-headers-6.1.0-23-amd64          6.1.99-1                       amd64        Header files for Linux 6.1.0-23-amd64
    ii  linux-headers-6.1.0-23-common         6.1.99-1                       all          Common header files for Linux 6.1.0-23
    ii  linux-headers-amd64                   6.1.99-1                       amd64        Header files for Linux amd64 configuration (meta-package)

 # sysdig

## Instalacion como binario


https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-for-Linux


https://www.youtube.com/watch?v=UJ4wVrbP-Q8   (Santo grial)



**Debe utilizarse con permisos de root para loder cargar el driver de captura (scap.ko)**

    error opening device /dev/scap0. Make sure you have root credentials and that the scap module is loaded: Permission denied

Validar que haya quedado instalado:

    find /lib/modules/$(uname -r) -name scap.ko
    find /lib/modules/$(uname -r) -type f -name '*.ko'

Ver todos los events "supported fields") Al parecer hay mas info que en la web official.

    sysdig -l 


En caso de que ejecuten un comando:


All the open system calls invoked by cat

    $ sysdig proc.name=chromium and evt.type=open    (QUITAR EL OPEN)


Print the name of the files opened by cat

    $ sysdig -p"%evt.arg.name" proc.name=chromium and evt.type=open

    ./sysdig proc.name=cat

    sysdig proc.name=cat or proc.name=vi

    sysdig proc.    kubectl cp ...name!=cat and evt.type=open


FABRICIO, buscar el proceso mas algun syscall malicioso o el binario.


sysdig -X "evt.type in (write, sendto, read, recvfrom) and fd.type in (ipv4, ipv6) \
    and proc.name=java" \
    -p"%fd.name (%evt.type, %evt.buflen bytes) %evt.buffer"




## csysdig


Es mas facil con csysdig, tiene una pseudo interfaz grafica


## Mac



    brew install sysdig

En M1 aparece: 



# Referencias


    https://github.com/annulen/sysdig-wiki/blob/master/Sysdig-User-Guide.md
    
    https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-for-Linux

    https://github.com/annulen/sysdig-wiki/blob/master/Chisels-User-Guide.md


# Summary


Funciono en docker en equipo personal como binario y como contenedor.
No funciono en GCP


sudo docker run -i -t --name draios --privileged --net=host \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /src:/src \
    -v /lib/modules:/host/lib/modules:ro \
    -v /usr:/host/usr:ro \
    -v /etc:/host/etc:ro \
    docker.io/sysdig/sysdig


    docker run -i -t --name sysdig --privileged -v /var/run/docker.sock:/host/var/run/docker.sock -v /dev:/host/dev -v /proc:/host/proc:ro -v /boot:/host/boot:ro -v /lib/modules:/host/lib/modules:ro -v /usr:/host/usr:ro sysdig/sysdig