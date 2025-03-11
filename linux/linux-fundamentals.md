# Linux fundamentals

    sudo lshw -short -C memory
    lscpu




## Information

        arch
        lsb_release -a  version
        lsb_release -drc
        /cat/etc/issue version exacta del SO


## Files

    ls -lhai (inode)
    type -a ls
    which -a ls



## Core utils

coreutils es un paquete que contiene herramientas esenciales como ls, cat, echo, rm, etc.

    dpkg -l | grep coreutils
    ls --version



## Devices

   0    Unnamed devices (e.g. non-device mounts)

		  0 = reserved as null device number
		See block major 144, 145, 146 for expansion areas.

   1 char	Memory devices

		  1 = /dev/mem		Physical memory access
		  2 = /dev/kmem		OBSOLETE - replaced by /proc/kcore
		  3 = /dev/null		Null device
		  4 = /dev/port		I/O port access
		  5 = /dev/zero		Null byte source
		  6 = /dev/core		OBSOLETE - replaced by /proc/kcore
		  7 = /dev/full		Returns ENOSPC on write
		  8 = /dev/random	Nondeterministic random number gen.
		  9 = /dev/urandom	Faster, less secure random number gen.
		 10 = /dev/aio		Asynchronous I/O notification interface
		 11 = /dev/kmsg		Writes to this come out as printk's, reads
					export the buffered printk records.
		 12 = /dev/oldmem	OBSOLETE - replaced by /proc/vmcore

   1 block	RAM disk

		  0 = /dev/ram0		First RAM disk
		  1 = /dev/ram1		Second RAM disk
		    ...
		250 = /dev/initrd	Initial RAM disk

		Older kernels had /dev/ramdisk (1, 1) here.
		/dev/initrd refers to a RAM disk which was preloaded
		by the boot loader; newer kernels use /dev/ram0 for
		the initrd.

   2 char	Pseudo-TTY masters

		  0 = /dev/ptyp0	First PTY master
		  1 = /dev/ptyp1	Second PTY master
		    ...
		255 = /dev/ptyef	256th PTY master

   4 char	TTY devices

		  0 = /dev/tty0		Current virtual console

		  1 = /dev/tty1		First virtual console



https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/devices.txt

## Shells

    /etc/shell
    chsh -s /bin/bash  (Cambiar la shell de un usuario)

    /bin/bash -c (interactive shell)
  

    El raro para el entorno cuando se monta un File system como un virtual enviroment  chroot

    /bin/bash -p   (Preservar trabajos en segundo plano. Trabajos continuan ejecutandose en shell padre)

bas, rbash (restricted bash)

subshell echo "$(</etc/shadow)"


vaina del mount (Escalar")


whiptail  (cuadros de dialogo)


## Install packages (apt-utils)

- Instalar aplicaciones

    apt-get autoremove
    apt-get clean
    apt-get --only-upgrade install sudo
    hay uno con mark para que no actualice cierto paquete.
    apt install -fy ./rustdesk-1.2.7-x86_64.deb (cuando falla dpkg -i)
    hay otro que busca los paquetes y dependencias. 
    apt install -f debe de ser ..
    apt-mark hold sudo
    apt-get install --reinstall sudo

    dpkg -l | grep linux-headers


Extraer version de paquete

    sudo apt-get install dpkg-repack
    dpkg-repack sudo

    dpkg -S /usr/lib/x86_64/libgtk-3-common.so



    dpkg --get-selections  Ver paquetes instalados en el sistema
    scp sudo_1.8.21p2-3ubuntu1.6_amd64.deb usuario@otro_servidor:/ruta/destino pragmatic 
    sudo_1.8.21p2-3ubuntu1_amd64.deb  iso viejo

    docker cp <container_id>:/path/to/file/sudo_1.8.21p2-3ubuntu1_amd64.deb .
    docker cp falco-workshop:/sudo_1.8.21p2-3ubuntu1_amd64.deb .

    docker cp falco-workshop:/nano_2.9.3-2_amd64.deb .
    

    


    Dependencias de un paquete: (Librerias)

    ldd /usr/bin/sudo


## Environment variables

    export PATH=$PATH:/usr/local/go/bin
    source ~/.bashrc
    export x=5 ; echo $x (Actual process memory and child processes)
    env

    cat /etc/environment

    printenv  (ver variables de entorno del sistema)
    set
    export
    unset
    source
    source script.sh
    echo $$


    
## Montajes

    m-tools

    sudo mount -o bind /bin/sh /bin/mount

    cat /etc/mtab or cat /proc/mounts


## Privileges

    Toamr del whatsapp

    NOPASSWD  (sudoers)

## Grep

    grep -B 3 -A 5 "Disallowed SSH Connection" falco_rules.yaml
    grep -rl 'dockerfile: dockerfile' --include=docker-compose.yml .

    zgrep

    find
    findstr


## Monitoring


    htop
    top
    iotop ()
    iftop  (estado de la red)

    vmstat 1  (ver memoria)


    strace -p <PID> (rastrear llamadas al sistema)
    ltrace
 

## Compression tools


    tar xzvf
    untar
    zip
    zip -r ~/Desktop/proyecto.zip ~/Desktop/proyecto
    bzcat
    zcat
    bzmore