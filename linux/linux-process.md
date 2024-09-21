# Procesos

    ps -ef

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