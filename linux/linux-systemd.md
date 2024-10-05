# Linux systemd


    man init


    SYSTEMD(1)                       systemd                      SYSTEMD(1)

    NAME
        systemd, init - systemd system and service manager

    SYNOPSIS
        /lib/systemd/systemd [OPTIONS...]

        init [OPTIONS...] {COMMAND}

    DESCRIPTION

        systemd is a system and service manager for Linux operating systems. When run as first process on boot (as PID 1), it acts as init system that brings up and maintains userspace services.
        Separate instances are started for logged-in users to start their services.

        systemd is usually not invoked directly by the user, but is installed as the /sbin/init symlink and started during early boot. The user manager instances are started automatically through the
        user@.service(5) service.

        For compatibility with SysV, if the binary is called as init and is not the first process on the machine (PID is not 1), it will execute telinit and pass all command line arguments
        unmodified. That means init and telinit are mostly equivalent when invoked from normal login sessions. See telinit(8) for more information.

        When run as a system instance, systemd interprets the configuration file system.conf and the files in system.conf.d directories; when run as a user instance, systemd interprets the
        configuration file user.conf and the files in user.conf.d directories. See systemd-system.conf(5) for more information.


De lo anterior: (/sbin/init)

El proceso init en Linux es el primer proceso que se ejecuta durante el arranque del sistema, identificado como PID 1. Su función principal es iniciar y gestionar todos los demás procesos del sistema. En sistemas modernos, el proceso init es gestionado por systemd, que actúa como el sistema de inicio (init system), levantando y manteniendo los servicios en el espacio de usuario.
Por lo general, el usuario no invoca directamente a systemd, sino que este se instala como el enlace simbólico **/sbin/init** y se inicia durante el arranque temprano del sistema. Las instancias del administrador de usuarios se inician automáticamente a través del servicio user@.service(5).


    diegoall@pho3nix:~/courses$ ps -fp 1
    UID          PID    PPID  C STIME TTY          TIME CMD
    root           1       0  0 sep25 ?        00:00:34 /sbin/init splash


    diegoall@pho3nix:~/courses$ ps aux | grep 'systemd'
    root         394  0.0  0.0  90224 54184 ?        S<s  sep25   0:46 /lib/systemd/systemd-journald
    root         464  0.0  0.0  27340  5760 ?        Ss   sep25   0:02 /lib/systemd/systemd-udevd
    systemd+     792  0.0  0.0  14836  6144 ?        Ss   sep25  11:05 /lib/systemd/systemd-oomd
    systemd+     793  0.0  0.0  30564 18112 ?        Ss   sep25   4:09 /lib/systemd/systemd-resolved
    systemd+     794  0.0  0.0  89388  6656 ?        Ssl  sep25   0:01 /lib/systemd/systemd-timesyncd
    message+     944  0.0  0.0  11396  7284 ?        Ss   sep25   3:00 @dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
    root         969  0.0  0.0  48408  7844 ?        Ss   sep25   0:03 /lib/systemd/systemd-logind
    root         970  0.0  0.0 278840 10112 ?        Ssl  sep25   4:27 /usr/sbin/thermald --systemd --dbus-enable --adaptive
    diegoall    5544  0.0  0.0  18780 11468 ?        Ss   sep25   0:36 /lib/systemd/systemd --user
    diegoall    5576  0.0  0.0  10800  5780 ?        Ss   sep25   1:21 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
    diegoall    6101  0.0  0.0 521948 16768 ?        Ssl  sep25   0:02 /usr/libexec/gnome-session-binary --systemd-service --session=ubuntu
    diegoall 2101740  0.0  0.0  11828  2688 pts/76   S+   15:43   0:00 grep --color=auto systemd


systemctl status  (Al parecer con este comando puedo ver todos los procesos del sistema)


             ├─snap.docker.dockerd.service 
             │ ├─   2332 dockerd --group docker --exec-root=/run/snap.docker --data-root=/var/snap/docker/common/var-lib-docker --pidfile=/run/snap.docker/docker.pid --config-file=/var/snap/docker/2932/c>
             │ ├─   2706 containerd --config /run/snap.docker/containerd/containerd.toml --log-level error
             │ ├─   3518 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8026 -container-ip 172.27.0.2 -container-port 8026
             │ ├─   3527 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 8026 -container-ip 172.27.0.2 -container-port 8026
             │ ├─   3550 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 1026 -container-ip 172.27.0.2 -container-port 1026
             │ ├─   3558 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 1026 -container-ip 172.27.0.2 -container-port 1026
             │ ├─   3592 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 27017 -container-ip 172.19.0.2 -container-port 27017
             │ ├─   3623 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8025 -container-ip 172.25.0.2 -container-port 8025
             │ ├─   3631 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 8025 -container-ip 172.25.0.2 -container-port 8025
             │ ├─   3657 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 1025 -container-ip 172.25.0.2 -container-port 1025
             │ ├─   3666 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 1025 -container-ip 172.25.0.2 -container-port 1025
             │ ├─   3700 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 54320 -container-ip 172.27.0.3 -container-port 54320
             │ ├─   3708 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 54320 -container-ip 172.27.0.3 -container-port 54320
             │ ├─   3774 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 8889 -container-ip 172.19.0.3 -container-port 8889
             │ ├─   3782 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 5432 -container-ip 172.25.0.3 -container-port 5432
             │ ├─   3793 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 5432 -container-ip 172.25.0.3 -container-port 5432
             │ ├─   3835 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 8888 -container-ip 172.19.0.3 -container-port 8888
             │ ├─   3855 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 8182 -container-ip 172.19.0.4 -container-port 8182
             │ ├─   3894 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 8099 -container-ip 172.19.0.4 -container-port 8099
             │ ├─   4286 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 3d0101191a5cb81d114d85e6b6a204396082a1c3f4c303074c6ea06beedad06e -address /run/snap.docker/containerd/containerd>
             │ ├─   4287 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 42a645a6fb2677dc60858a8592348b12db93971b16065e6e2c2e9a738adf8ebc -address /run/snap.docker/containerd/containerd>
             │ ├─   4288 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 123cf14092e359b4d1e8cc4119e9ee59e8a9f64e9754609fc6ec56e6591ef4c5 -address /run/snap.docker/containerd/containerd>
             │ ├─   4289 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id ec586b1da01d8a2eb80e93dc2980a49f0ee55c40198d131a5c57e54a8f50670f -address /run/snap.docker/containerd/containerd>
             │ ├─   4290 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 026243e9a8ad207343895f246127510b6258cf0dabc938d5265fd65b4713015c -address /run/snap.docker/containerd/containerd>
             │ ├─   4291 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id bcc3dad4a1023a66409ad5a4dc9fdff6414902c0d172d77bf6541142a2a64499 -address /run/snap.docker/containerd/containerd>
             │ ├─   4292 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 834843c737983b4a021e37fa7db6eb37693a439f24bc45ee174853dd41ce5a63 -address /run/snap.docker/containerd/containerd>
             │ ├─  47714 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 380c35895106530cb465deadee53c93cb488c0bca82d817cf0f0515df640ffde -address /run/snap.docker/containerd/containerd>
             │ ├─ 511176 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id 836c8104581dcdf3bc0e527242b32e9486a906e7fb7792ab161edca80cdd132e -address /run/snap.docker/containerd/containerd>
             │ ├─3548573 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 5000 -container-ip 172.17.0.2 -container-port 5000
             │ ├─3548579 /snap/docker/2932/bin/docker-proxy -proto tcp -host-ip :: -host-port 5000 -container-ip 172.17.0.2 -container-port 5000
             │ └─3548592 /snap/docker/2932/bin/containerd-shim-runc-v2 -namespace moby -id c6f66374fb518957784ac337876c116b5db8f2129959c9c8e9d6bf4079921380 -address /run/snap.docker/containerd/containerd>
             ├─udisks2.service 




    ls -l /proc/1


    diegoall@pho3nix:~/courses$ lsof -p 1
    lsof: WARNING: can't stat() overlay file system /var/lib/docker/overlay2/100f05523e5d668e6f13d6d681468d6d81d0c111a06ec1c760a7e8b5c0f303f6/merged
        Output information may be incomplete.
    lsof: WARNING: can't stat() overlay file system /var/lib/docker/overlay2/590439b124ccae098094e783524b3e466b0187f4368572aee54e55490f3ddfae/merged
        Output information may be incomplete.
    lsof: WARNING: can't stat() overlay file system /var/lib/docker/overlay2/d390b6af6ac24007f1b734ba068355b77f7260c75e0df503c78ed43159ebfb9b/merged
        Output information may be incomplete.
    lsof: WARNING: can't stat() overlay file system /var/lib/docker/overlay2/586e3190c212d4d0c4ed0c496dd0dbfc6679604a0054ec475224e364ef59c4d1/merged
        Output information may be incomplete.
    lsof: WARNING: can't stat() overlay file system /var/lib/docker/overlay2/3e029941fa94ab4f01840a7af2adca4019386a950ae4f04aa7fe344d5ce08683/merged
        Output information may be incomplete.
    lsof: WARNING: can't stat() nsfs file system /run/docker/netns/f69788072bee
        Output information may be incomplete.
    lsof: WARNING: can't stat() nsfs file system /run/docker/netns/4138c7f1ad59
        Output information may be incomplete.
    lsof: WARNING: can't stat() nsfs file system /run/docker/netns/82b0971b144b
        Output information may be incomplete.
    lsof: WARNING: can't stat() nsfs file system /run/docker/netns/4b243675bf4d
        Output information may be incomplete.
    lsof: WARNING: can't stat() nsfs file system /run/docker/netns/de32fa73c246
        Output information may be incomplete.
    lsof: WARNING: can't stat() tracefs file system /sys/kernel/debug/tracing
        Output information may be incomplete.
    COMMAND PID USER   FD      TYPE DEVICE SIZE/OFF NODE NAME
    systemd   1 root  cwd   unknown                      /proc/1/cwd (readlink: Permission denied)
    systemd   1 root  rtd   unknown                      /proc/1/root (readlink: Permission denied)
    systemd   1 root  txt   unknown                      /proc/1/exe (readlink: Permission denied)
    systemd   1 root NOFD                                /proc/1/fd (opendir: Permission denied)



journalctl -u systemd



sudo strace -p 1


cat /proc/1/status



kill -9 1  (Puedes causar un comportamiento inesperado, que generalmente resultará en que el sistema se bloquee o se apague)


## Enfoque a containers


las imágenes de Docker que no tienen systemd instalado, el proceso init es típicamente el proceso principal que defines en el Dockerfile o en el comando de inicio del contenedor. Este proceso es el que se ejecuta con el PID 1, y es responsable de todos los demás procesos dentro del contenedor.

Por defecto:
Si no configuras un sistema de inicio (como systemd o sysvinit), el proceso init será el comando principal que se ejecute en el contenedor. Por ejemplo, si ejecutas un contenedor basado en una imagen de nginx, el proceso nginx será el proceso con PID 1.


Opciones alternativas:
Tini o Dumb-init: En algunas imágenes de Docker, se instala un proceso de init ligero como tini o dumb-init para manejar adecuadamente las señales de procesos y evitar que los procesos huérfanos se acumulen.

Si tu imagen usa tini, este será el proceso init con PID 1. Puedes instalarlo manualmente si necesitas mejorar la gestión de procesos dentro del contenedor.
Ejemplo de un Dockerfile con tini:

Dockerfile
Copiar código
FROM ubuntu:latest
RUN apt-get update && apt-get install -y tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["your-application"]
Cómo verificar el proceso init:
Para ver cuál es el proceso PID 1 en tu contenedor, puedes ejecutar:

bash
Copiar código
docker exec -it <nombre-contenedor> ps -ef
Esto te mostrará cuál es el proceso que está corriendo como PID 1, que será el proceso principal dentro del contenedor.