# Get root



        cat /proc/self/status  (Se puede ver si se es root, tambien validar si estan todos los procesos)

        cd /dev && ls (revisar la lista de dispositivos)


Validar capabilities


CAP_SYS_MODULE  Load Kernel modules

after escalate privileges CAP_SYS_MODULE

CReate a new device pointing yo the host hard drive and mount it inside the container

    mknod xvda1 b 202 1


change process namespace to those of the host's. 
Linux kernel’s namespaces are stored in a special structure called nsproxy, so after obtaining the task_structure’s address, we call the switch_task_namespaces() function with the task_structure of process 1 and the address of init_nsproxy structure, which contains the namespaces of the init process

Try nsenter function, is a wrapper which changes the current namespaces with those of other processes.


Changing the mnt and pid namespaces is enough to achieve the desired escape to the host.
Now you have access to the underlying host. All processes All files. All devices. You now own the initial foothold .. The network is the next.

Show how Docker container's defense in deepth strategy temporarily stopped our black-hat hacker from escaping to the underlying host.

https://www.cyberark.com/resources/threat-research-blog/the-route-to-root-container-escape-using-kernel-exploitation



(jailbreak)




Combinacion de comandos con reidrecciones de salida. (Obtener una secuencia que permita obtener acceso no autorizado al sistema).