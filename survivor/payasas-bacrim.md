# Payasas b4cr1m


    kubectl run run -i --tty --privileged --image debian debiandeb  NO FUNCIONA



    kubectl run -i --tty --privileged --image debian:latest debiandeb  NO FUNCIONA
    kubectl run -i --tty --privileged --image bitnami/python python-test FUNCIONA
    kubectl run -i --tty --privileged --image archlinux/archlinux archlinux-test FUNCIONA
    kubectl run -i --tty --privileged --image diegoall1990/ubuntu-lab:1.0.0 ubuntu-lab   FUNCIONA

    kubectl run -i --tty --privileged --image neurodebian neurodebian   error: timed out waiting for the condition   DESPUES SUBIO SOLA??? PAYASAS
    kubectl run -i --tty --privileged --image ubuntu:20.04 ubuntu20-04  error: timed out waiting for the condition
    kubectl run -i --tty --privileged --image archlinux archlinux-test  error: timed out waiting for the condition
    kubectl run -i --tty --privileged --image debian:bullseye debian-bullseye   error: timed out waiting for the condition



https://blog.flowlab.no/running-a-debian-pod-on-kubernetes-with-kubectl-beb349b40ff2

    kubectl run flow-pod -i --tty --image debian:bullseye --restart=Never -- bash              (error: timed out waiting for the condition)

https://gc-taylor.com/blog/2016/10/31/fire-up-an-interactive-bash-pod-within-a-kubernetes-cluster    (error: timed out waiting for the condition)

    kubectl run my-shell -i --tty --image ubuntu -- bash


HAY WORDPRESS EN BITNAMI: https://hub.docker.com/r/bitnami/wordpress

https://hub.docker.com/r/bitnami/debian-base-buildpack


    kubectl run -i --tty --privileged --image bitnami/debian-base-buildpack bit-debian-base   CreateContainerError


    docker pull bitnami/debian-base-buildpack




    eval "$(ssh-agent -s)"
    ssh-add <keypath>
    ssh-add -l


    $ ssh-keygen -t rsa -b 4096 -C email

    -t: Algoritmo para crear la llave.
    -b: complejidad
    -C: email conectado a la llave
    Con que usuario fue creada una llave

    $ cat /Users/mac/.ssh/id-rsa.pub
    Agregar al agente SSH

    $ eval ”$(ssh-agent -s)”
    $ ssh-add -k /.ssh/id-rsa (-k keychain MacOSX)
    Configurar llave p´ublica en Github
    pbcopy ¡ /.ssh/id rsa.pub (Mac OS)
    cat gcp-dposada.pub — pbcopy
    clip (Windows)

    ssh override
