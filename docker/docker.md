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



    docker pull golang
    docker ps -l
    docker run --rm -dti --net host --name host --name golang golang bash
    docker rm -fv 88ac6b0b29df

    docker build -t k8s-hands-on:0.0.1 -f Dockerfile .
    docker run -d -p 9001:9001 --name k8s-hands-on k8s-hands-on
    docker rm -fv k8s-hands-on  (Buena practica recomendado)
    

trin

    docker build --no-cache -t diegoall1990/falco-workshop:0.0.1 .


    docker run -d -it --net host --pid host --userns host --privileged --cap-add=ALL --name broken-cgroup1 ubuntu:22.04 sleep 36000

    docker run --pid=host --privileged --name admin-container ubuntu:latest tail -f /dev/null
    docker run -t -d -p 127.0.0.1:9980:9980 -e 'domain=cloud\\.nextcloud\\.com' --restart always --cap-add MKNOD collabora/code
    docker run --cap-drop=ALL --cap-add=NET_BIND_SERVICE --user=nobody nordvpn
    sudo docker run -it --rm --security-opt apparmor=unconfined ubuntu bash

    docker run -v /:/mnt --rm -it alpine chroot /mnt sh 

iso a tarballs

tenia unas copias de imagenes de contenedores dañados.


load

guido



    docker exec -it -u pepe 52753da1adc0 /bin/bash

    docker exec -it 52753da1adc0 passwd pepe

    docker exec -it -u pepe 52753da1adc0 /bin/bash

    docker exec -it <nombre_del_contenedor> bash -c "echo 'pepe ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"

    docker exec -it -u 0 containerName /bin/bash

    docker exec -it products_pg_db psql -U postgres -d e_commerce
    
    docker exec -it mysql-server mysql -h 127.0.0.1 -P 3306 -u user -p


    
    
    docker cp <container_id>:/paquetes_instalados.txt /ruta/local/

    docker inspect diegoall/ubuntu-18.04-desktop-amd64:0.0.1

    docker commit

    docker tag <IMAGE ID> <NEW_REPOSITORY>:<NEW_TAG>

    docker login -u <username>
    more ~/.docker/config.json
    echo "dfsdafsdfsdfsdafdsfsdaff" | base64 -d   (Basic Auth) codificada en Base64.




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

    docker tag ...



    docker run --rm -i -t --entrypoint=/bin/bash   // sobrescribir el entrypoint predeterminado definido en la imagen.

    Diferencia entre --entrypoint y CMD:
    CMD: Define el comando predeterminado que se ejecutará al iniciar el contenedor, pero puede ser sobrescrito cuando se ejecuta docker run con un comando explícito.
    --entrypoint: Reemplaza completamente el entrypoint predeterminado, dejando a CMD (si existe) o el argumento de docker run como el comando a ejecutar.



    docker run --rm -i -t ubuntu bash -c "echo 'Hello from Docker!'"
    docker run --rm --entrypoint=/usr/bin/env ubuntu
    docker run --rm -i -t --entrypoint=/usr/bin/env ubuntu bash /scripts/myscript.sh
    docker run --rm -i -t --entrypoint=/usr/bin/env ubuntu python3 /scripts/myscript.py





    docker info



    docker ps -a --filter "status=exited"


Consultar el log de docker

    journalctl -u docker.service


Backup Containers


back up docker images
To back up docker images, use the docker save command that will produce a tar archive that can be used later on to create a new docker image with the docker load command.

    docker save <>
    docker load <>

Reference: https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes


    docker commit 



    https://quickref.me/docker