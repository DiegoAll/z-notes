# Get root



        cat /proc/self/status  (Se puede ver si se es root, tambien validar si estan todos los procesos)

        cd /dev && ls (revisar la lista de dispositivos)


Validar capabilities


CAP_SYS_MODULE  Load Kernel modules

after escalate privileges CAP_SYS_MODULE

CReate a new device pointing yo the host hard drive and mount it inside the container

    mknod xvda1 b 202 1


change process namespace to those of the host's.

