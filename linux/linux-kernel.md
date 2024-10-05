# Linux kernel


https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git

    cat /proc/cmdline


    dmesg | grep 'kernel'

    echo "$(</etc/shadow)"



    m file
    make all

    modprobe

    sudo insmod hello_world_mod.ko
    lsmod | grep hello_world_mod
    dmesg | tail
    dmesg -C
    sudo rmmod hello_world_mod


    dkms, insmod, modprobe, modinfo


## Kernel parameters

    /etc/sysctl.conf
    sysctl -p
    sysctl -w kernel.core_pattern 
    sysctl net.ipv4.ip_forward=1

    sysctl -w kernel.sysrq=1  "System Request" a.k.a Magic Keys  (Also Can be used using a specific keyboard sequence)
    more /proc/sys/kernel/sysrq


## Shared libraries

    readelf (magic numbers)
    ldd


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

Recordar mañana con Domingo.


https://www.reddit.com/r/kubernetes/comments/zssyrg/how_to_load_kernel_modules_into_node/



Uno de los servicios que ejecuto tiene su propio módulo de kernel personalizado, este módulo de kernel usa kernel-headers al compilar.

Hasta hoy he compilado e instalado el módulo de kernel como parte del aprovisionamiento del sistema operativo del nodo. Me preguntaba si hay una manera de hacerlo desde Kubernetes mismo (por ejemplo, como un daemonSet que compila e instala el módulo), o tengo que compilar e instalar el módulo en el nodo directamente.

    Debería ser más que posible hacer esto con un daemonset.
    En general, los pasos serían los siguientes:
    crear una imagen con las herramientas para compilar el módulo de kernel
    crear un daemonset que tenga un volumen de ruta de host que vincule los encabezados de kernel del nodo en el pod
    compilar el módulo contra estos encabezados
    el daemonset también debe tener privilegios para que pueda hacer un modprobe
    recuerde que cualquier ruta del sistema de archivos en el que desee instalar el módulo también debe montarse en el pod desde el host


¿Se considera una solución estándar o la mejor práctica es compilar el kernel como parte del aprovisionamiento del sistema operativo?

Si se hace en el nodo, se debe acceder a el, en algunos con ssh y el .pem del nodo. Peor en EKS es otro tema.

Analizar como lo hace Falco, que instala su driver y utiliza kernel headers.


Este es el mismo error que me pasa.

https://stackoverflow.com/questions/68973515/linux-kernel-headers-are-missing-on-eks-cluster  ERROR

https://github.com/awslabs/amazon-eks-ami/issues/1266


- Quizas buscar una imagen en dockerhub que tenga el kernel




Acceder por consola web al nodo.

A traves de EC2 acceder a la instancia correspondiente al nodo.

Session manager o instance connect.


O Utilizar el CLI de AWS como emn este video:  https://www.youtube.com/watch?v=lceFU-Ov9qc


Probar free tier de AKS o el de EAFIT.

EKS Latest kernel release 5.4.238-148.346 has no headers/devel packages
https://github.com/awslabs/amazon-eks-ami/issues/1266



Aca tengo el LKM que construi

https://github.com/diego-all/worksh0p/blob/main/Makefile


Hay uno en youtube pendiente


### Kernel parameters


    sysctl -a

kernel.core_pattern = "value"


net.ipv4*


## References

    https://medium.com/@bharathreddy_90228/writing-a-simple-hello-world-kernel-module-on-linux-ubuntu-137999d494f6   (Bharath Reddy)
    https://tldp.org/LDP/lkmpg/2.6/html/lkmpg.html


