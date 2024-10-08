# Procesos

    ps -ef (STIME)
    ps -aef
    ps -x

    ps -u mister procesos siendo ejecutados por el usuario mister

    sudo pkill -u mister Finalizar los procesos del usuario mister

    pidof

    ps -q 20075 -o command= | cat

    pstree

    ps -p <PID> -o pid,ppid,cmd,%mem,%cpu

    pstack <pid>  (ver stack de un proceso)

    perf stat <pid>


    estaba viendo en meli.udemy un curso comptia ahi hay varia data.

    
    pstree
    psmisc (al parecer es para mac)

    ps -p <PID> -o pid,ppid,cmd,%mem,%cpu


    killall -u username

    kill -9



    /bin/bash -c (interactive shell) proceso hijo recordar EN el mismo contexto


    cat /proc/self/status  (Se puede ver si se es root, tambien validar si estan todos los procesos)
    ls /proc/self/ns -lia  (Each virtual file abovedesignates a different kernel namespace, witha total of seven namespaces ipc:[35343="inode"])


    pscap ?

    escapado de caracteres especiales
    $$$$ (doble escapado)
    expansion de shell (se expande auytomaticamente al pid del proceso actual)
    pid="$$$$"


