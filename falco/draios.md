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

 