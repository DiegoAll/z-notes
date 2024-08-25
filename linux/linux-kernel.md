# Linux kernel

    cat /proc/cmdline


    dmesg | grep 'kernel'

    

    echo "$(</etc/shadow)"


## In kubernetes

Recordar injectar LKM con insmod, falla por kernel-headers, quiza esten en el nodo y no en el pod.

    https://kmm.sigs.k8s.io/lab/

Load kernel module into node

    https://www.reddit.com/r/kubernetes/comments/zssyrg/how_to_load_kernel_modules_into_node/

Todos los pods en el mismo nodo tienen el mismo kernel (Es compartido).
Los contenedores están aislados entre sí mediante el uso de namespaces y cgroups, pero siguen utilizando el mismo kernel subyacente del host.
    
    uname -r


Chequear esto

    wget http://amazonlinux.us-east-1.amazonaws.com/2/extras/kernel-5.4/latest/x86_64/mirror.list
    
    wget amazonlinux.us-east-1.amazonaws.com/blobstore/e12d27ecb4df92edc6bf25936a732c93f55291f7c732b83f4f37dd2aeaad5dd4/kernel-headers-5.4.117-58.216.amzn2.x86_64.rpm

/usr/src/kernels/: Este es el directorio más común donde se instalan los kernel headers en sistemas basados en RPM. Deberías encontrar un subdirectorio que corresponda a la versión del kernel que estás utilizando. En tu caso, deberías buscar un directorio como:

/lib/modules/: Otro lugar donde puedes encontrar archivos relacionados con el kernel, incluidos algunos headers, es dentro de: