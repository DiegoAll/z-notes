# Linux kernel

    cat /proc/cmdline


    dmesg | grep 'kernel'

    

    echo "$(</etc/shadow)"


## In kubernetes

Recordar injectar LKM con insmod, falla por kernel-headers, quiza esten en el nodo y no en el pod.

    https://kmm.sigs.k8s.io/lab/