


        tar -C unsquashfs -c . | docker import - diegoall/new-ubuntu-18.04-desktop-amd64:0.0.1

        docker run -it -d --name ubuntu18-recreated -h ubuntufromiso diegoall/ubuntu-18.04-desktop-amd64:0.0.1
        docker run -it -d --name falco-workshop -h victim diegoall/new-ubuntu-18.04-desktop-amd64:0.0.1 /bin/bash


        Adelgazar imagen
    
        dpkg --get-selections   1783  1562


        apt-get remove --purge remmina remmina-common \
        remmina-plugin-rdp:amd64 remmina-plugin-secret:amd64 \
        remmina-plugin-vnc:amd64

        sudo apt-get remove --purge thunderbird thunderbird-gnome-support thunderbird-locale-de thunderbird-locale-en thunderbird-locale-en-gb thunderbird-locale-en-us thunderbird-locale-es thunderbird-locale-es-ar thunderbird-locale-es-es thunderbird-locale-fr thunderbird-locale-it thunderbird-locale-pt thunderbird-locale-pt-br thunderbird-locale-pt-pt thunderbird-locale-ru thunderbird-locale-zh-cn thunderbird-locale-zh-hans thunderbird-locale-zh-hant thunderbird-locale-zh-tw

        thunderbird

        apt-get autoremove
        apt-get clean




        root@victim:/# dpkg --get-selections | wc - l 995


        exit
        docker commit <container_id> diegoall/ubuntu-18.04-desktop-amd64:reduced

        root@pho3nix:/home/diegoall# docker commit falco-workshop diegoall1990/falco-workshop-vuln:0.0.1  
        sha256:71935c76ddddad8f4d36e7902f08b6f0a3948b692a490d4ad4233b119cadd6e1


        root@pho3nix:/home/diegoall# docker images
        REPOSITORY                                TAG       IMAGE ID       CREATED             SIZE
        diegoall1990/falco-workshop-vuln          0.0.1     71935c76dddd   3 minutes ago       4.33GB
        diegoall/new-ubuntu-18.04-desktop-amd64   0.0.1     dd8cf0208d18   About an hour ago   4.27GB


        docker tag dd8cf0208d18 diegoall1990/falco-workshop-vuln:0.0.1