# Processes



    /proc/version - OS Version
    /proc/net/tcp - open TCP ports
    /proc/net/udp - open UDP ports
    /proc/sched_debug - can be used to retrieve running processes
    /proc/mounts - Mounted devices
    /proc/[PID]/cmdline - command line that triggered the running process
    /proc/[PID]/environ - environment variables accessible to the process
    /proc/[PID]/cwd - current working directory of the process
    /proc/[PID]/fd/[n] - files opened by the process
    /proc/[PID]/exe - link to the executable file

Leer variables de entorno

    strings /proc/2604/environ
    cat /proc/2604/environ
    strings /proc/$$/environ | grep -i kubernetes



    /proc/$pid/status




kthreadd: Hilo de trabajo del kernel. Es un proceso fundamental del sistema operativo Linux. tambien conocido como el demonio del kernel. Su funcion principal es gestionar la creación y ejecución de hilos de trabajo dentro del nucleo del sistema.
Son tareas que se ejecutan en el espacio de direcciones del nucleo del sistema. A diferencia de los procesos normales, estos hilos no están asociados a un usuario especifico y se encargan de realizar tareas de bajo nivel.

