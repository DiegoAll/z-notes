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


    