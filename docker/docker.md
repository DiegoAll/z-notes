# Docker


    # DiegoAll FalcoxLab Docker Image
    # 2022
    #
    # Build the image with:
    #   $ docker build -t diegoall1990/falco-workshop .
    #
    # Start a container for the first time from a built image with:
    #   $ docker run -it --name <name> -h <hostname> diegoall1990/falco-workshop:tagname
    #   $ docker run -it --name falco-workshop -h training diegoall1990/falco-workshop:tagname

trin

    docker build --no-cache -t diegoall1990/falco-workshop:0.0.1 .


    docker run -d -it --net host --pid host --userns host --privileged --cap-add=ALL --name broken-cgroup1 ubuntu:22.04 sleep 36000



iso a tarballs

tenia unas copias de imagenes de contenedores dañados.


load

guido



    docker exec -it -u pepe 52753da1adc0 /bin/bash

    docker exec -it 52753da1adc0 passwd pepe

    docker exec -it -u pepe 52753da1adc0 /bin/bash

    docker exec -it <nombre_del_contenedor> bash -c "echo 'pepe ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"



    
    
    docker cp <container_id>:/paquetes_instalados.txt /ruta/local/

    docker inspect diegoall/ubuntu-18.04-desktop-amd64:0.0.1

    docker commit

    docker tag <IMAGE ID> <NEW_REPOSITORY>:<NEW_TAG>




    dive docker-images

    root@pho3nix:/home/diegoall/courses/z-notes# dive diegoall/ubuntu-18.04-desktop-amd64:0.0.1
    Image Source: docker://diegoall/ubuntu-18.04-desktop-amd64:0.0.1
    Fetching image... (this can take a while for large images)
    Handler not available locally. Trying to pull 'diegoall/ubuntu-18.04-desktop-amd64:0.0.1'...
    cannot fetch image
    cannot find docker client executable

Al parecer solo funciona dive con imagenes con imagenes que estan en un registry. Intentar subirla luego.



    docker commit falco-workshop diegoall1990/falco-workshop-vuln:0.0.1


    docker tag dd8cf0208d18 diegoall1990/falco-workshop-vuln:0.0.1



Extraidos de csysdig

    docker attach
    docker inspect
    docker kill
    docker logs
    docker stop
    docker pause
    docker unpause
    docker wait




