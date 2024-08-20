# ISO to Docker Image

> filesystem.squashfs (Dilema encontrar esto, varia de acuerdo a cada distro)

> casper file

> SI fuera debian /live/filesystem.squashfs


https://www.techrepublic.com/videos/how-to-convert-an-iso-to-a-docker-image/


    apt-get install squashfs-tools -y

    mkdir rootfs unsquashfs
    sudo mount -o loop ~/<path>.iso ~/roots
    sudo mount -o loop /home/diegoall/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso.iso ~/rootfs

    mkdir rootfs unsquashfs
    sudo mount -o loop /home/diegoall/FALCO/falco-workshop/ubuntu-24.04-desktop-amd64.iso /home/diegoall/rootfs

    sudo umount ~/rootfs
    rm -r ~/rootfs ~/unsquashfs



    root@pho3nix:/home/diegoall# mount -o loop /home/diegoall/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso /home/diegoall/rootfs/
    mount: /home/diegoall/rootfs: WARNING: source write-protected, mounted read-only.


    cd rootfs

    find . -type f | grep filesystem.squashfs

    sudo unsquashfs/ rootf/casper/filesystem.squashfs NO FUNCIONA
    sudo unsquashfs/ rootf/casper/filesystem.squashfs


    unsquashfs rootf/casper/filesystem.squashfs




List of Commands:

sudo apt-get install squashfs-tools -y
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
mkdir rootfs unsquashfs
sudo mount -o loop ~/Downloads/ubuntu-20.04-live-server-amd64.iso ~/rootfs
cd ~/rootfs
find . -type f | grep filesystem.squashfs
cd ~/
sudo unsquashfs -f -d unsquashfs/ rootfs/casper/filesystem.squashfs
sudo tar -C unsquashfs -c . | docker import - IMAGENAME/TAG
docker images



## References

    https://www.youtube.com/watch?v=3lHGwrshnb4&t=146s

    https://www.techrepublic.com/videos/how-to-convert-an-iso-to-a-docker-image/

    https://dev.to/sofianehamlaoui/convert-iso-images-to-docker-images-18jh


    https://syst3mfailure.io/sudo-heap-overflow/  (MUY PRO)


    sudo unsquashfs -f -d unsquashfs/ rootfs/casper/filesystem.squashfs
    sudo tar -C unsquashfs -c . | docker import - IMAGENAME/TAG


DIEGO minimal.squashfs

    sudo unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.standard.squashfs


    unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.standard.squashfs  FUNCIONO
    tar -C unsquashfs -c . | docker import - diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.1   FUNCIONO

    sudo unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.squashfs


filesystem.squashfs


$ docker run -it -d --name ubuntu24 -h ubuntu-from-iso diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.1
docker run -it -d --name ubuntu24trin -h ubuntu-from-iso diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.2

docker run -it --name falco-workshop -h training diegoall1990/falco-workshop:tagname



RESUMEN

        apt-get install squashfs-tools -y

        mkdir rootfs unsquashfs

        mkdir -p /home/diegoall/rootfs
        mkdir -p /home/diegoall/unsquashfs

        sudo mount -o loop /home/diegoall/FALCO/falco-workshop/ubuntu-24.04-desktop-amd64.iso /home/diegoall/rootfs
        sudo mount -o loop /home/diegoall/FALCO/falco-workshop/ubuntu-18.04-desktop-amd64.iso /home/diegoall/rootfs

        root@pho3nix:/home/diegoall# mount -o loop /home/diegoall/FALCO/falco-workshop/ubuntu-24.04-desktop-amd64.iso /home/diegoall/rootfs
        mount: /home/diegoall/rootfs: WARNING: source write-protected, mounted read-only.

        cd casper

        unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.squashfs
        
        tar -C unsquashfs -c . | docker import - diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.1
        tar -C unsquashfs -c . | docker import - diegoall/ubuntu-24.04-desktop-amd64:0.0.2


        tar -C unsquashfs -c . | docker import - diegoall/ubuntu-18.04-desktop-amd64:0.0.1
        

SI SE LOGRA CREAR LA IMAGEN, PERO NO LEVANTA NO TIENE BINARIOS PARA TENER EL COMANDO DE EJECUCION PRINCIPAL. /bin/bash


Ahora si levanta:

    docker run -it diegoall/ubuntu-24.04-desktop-amd64:0.0.2 /bin/bash

El nombre no debe tener *.iso sino no funciona no se porque.

    docker run -it -d --name ubuntu24-recreated -h ubuntufromiso diegoall/ubuntu-24.04-desktop-amd64:0.0.2

    docker run -it -d --name ubuntu18-recreated -h ubuntufromiso diegoall/ubuntu-18.04-desktop-amd64:0.0.1

    docker run -it -d --name ubuntu-recreated -h ubuntuiso diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.1 /bin/bash

    docker run -it -d --name ubuntu-recreated -h ubuntuiso diegoall/ubuntu-24.04-desktop-amd64:0.0.2

docker: Error response from daemon: no command specified.  (agregar /bin/bash)

Remover por si se pega

    losetup -a | grep /dev/loop33
    losetup -d /dev/loop33

root@pho3nix:/home/diegoall/rootfs/ubuntu# docker run -it diegoall/ubuntu-24.04-desktop-amd64.iso:0.0.1 /bin/bash
docker: Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "/bin/bash": stat /bin/bash: no such file or directory: unknown.


SERA QUE EL MINIMAL NO LO TIENE??

USAR LA MAS COMPLETA !!





O POR ACA HAY UN PASQUIN QUE HACE ESO CON KALI

https://medium.com/@abaddonsd/create-docker-image-from-linux-iso-71f95a9c40f9


chroot env ??



El comando chroot se utiliza en sistemas Unix y Linux para cambiar el directorio raíz del entorno de ejecución de un proceso. Esto crea un "entorno chroot", que aísla el proceso y sus hijos de otras partes del sistema. Aquí están los usos más comunes y los conceptos clave asociados con chroot:

Usos Comunes de chroot
Entornos de Prueba: chroot se usa para crear un entorno aislado para probar software, configuraciones o sistemas operativos sin afectar el sistema principal.

Recuperación del Sistema: Se puede utilizar para acceder y reparar un sistema dañado. Por ejemplo, si el sistema principal no arranca, puedes montar el sistema de archivos en un entorno chroot desde un sistema en vivo (live CD o USB) para realizar tareas de mantenimiento.

Seguridad: Aunque no es una solución de seguridad completa por sí sola, chroot puede ayudar a limitar el alcance de un servicio o proceso para que no pueda afectar todo el sistema.

Entornos de Desarrollo y Construcción: Los desarrolladores pueden usar chroot para crear entornos controlados para construir y probar software en diferentes configuraciones sin afectar el entorno principal.

Sistemas Embebidos: En sistemas embebidos, chroot puede proporcionar un entorno controlado para aplicaciones específicas mientras se minimiza el impacto en el sistema operativo base.

Cómo Funciona chroot
Cambio de Directorio Raíz: chroot cambia el directorio raíz (/) del proceso especificado al directorio proporcionado. Esto significa que el proceso solo puede ver el sistema de archivos dentro de ese nuevo directorio raíz.

Aislamiento del Sistema de Archivos: Los procesos que se ejecutan dentro del entorno chroot no pueden ver ni acceder a archivos fuera del nuevo directorio raíz, proporcionando una forma básica de aislamiento.

Limitaciones:

No Aislamiento Completo: chroot no proporciona un aislamiento completo del sistema y no es una solución de contención tan segura como los contenedores Docker o las máquinas virtuales.
Escalabilidad: Los procesos en chroot aún pueden acceder a ciertos recursos del sistema si no están bien configurados.


docker run --rm -ti --shm-size=2g --device=/dev/net/tun --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add NET_ADMIN --runtime=sysbox-runc kali /sbin/init




https://discuss.linuxcontainers.org/



RECORDAR QUE SE EXTRAE DE LA ISO EN LA CARPETA SQUASHFS Y SE PUEDE MONTAR PARA ACCEDER A ELLA Y MODIFICAR LOS ARCHIVOS DEL SISTEMA

Dentro de /home/diegoall/unsquashfs

 2004  mount --bind /dev /home/diegoall/unsquashfs/dev
 2005  mount
 2006  mount --bind /sys /home/diegoall/unsquashfs/sys
 2007  mount --bind /proc /home/diegoall/unsquashfs/proc
 2008  mount --bind /run /home/diegoall/unsquashfs/run


chroot /home/diegoall/unsquashfs/


Entrar al chroot

Como distinguir si estoy en el anfitrion puede ser dificil pero.. con mount


    root@pho3nix:/# mount
    udev on /dev type devtmpfs (rw,nosuid,relatime,size=32686668k,nr_inodes=8171667,mode=755,inode64)
    sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
    proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
    tmpfs on /run type tmpfs (rw,nosuid,nodev,noexec,relatime,size=6545068k,mode=755,inode64)


    cat /proc/1/cgroup

    root@pho3nix:/# df /
    Filesystem     1K-blocks      Used Available Use% Mounted on
    -              502674496 100728640 376337972  22% /

    

debian



En la distribución de Debian, específicamente en la imagen ISO que mencionas (debian-10.7.0-amd64-DVD-1.iso), el archivo filesystem.squashfs suele encontrarse en las versiones live de Debian, ya que es una imagen comprimida del sistema de archivos que se utiliza para cargar el entorno live.

Sin embargo, la imagen DVD-1.iso de Debian que mencionas no es una versión live, sino una imagen de instalación. En este tipo de imágenes, no encontrarás un archivo filesystem.squashfs porque no está diseñado para cargarse en un entorno live.


Pailas segun esto en topic muy pro no se puede reproducir


### Reducir tamaño de la imagen convertida

Intentar eliminar paquetes innecesarios

root@ubuntufromiso:/# dpkg --get-selections | wc -l
1783





https://syst3mfailure.io/sudo-heap-overflow/


