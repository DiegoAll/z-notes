# Linux fundamentals



## Information

        arch
        lsb_release -a  version
        /cat/etc/issue version exacta del SO


## Shells

    /etc/shell
    chsh -s /bin/bash  (Cambiar la shell de un usuario)

    /bin/bash -c (interactive shell)
  

    El raro para el entorno cuando se monta un File system como un virtual enviroment


bas, rbash (restricted bash)

subshell echo "$(</etc/shadow)"


vaina del mount (Escalar")


whiptail  (cuadros de dialogo)


## Install packages (apt-utils)

- Instalar aplicaciones

    apt-get autoremove
    apt-get clean
    apt-get --only-upgrade install sudo
    hay uno con mark para que no actualice cierto paquete.
    apt install -fy ./rustdesk-1.2.7-x86_64.deb (cuando falla dpkg -i)
    hay otro que busca los paquetes y dependencias. 
    apt install -f debe de ser ..
    apt-mark hold sudo
    apt-get install --reinstall sudo

Extraer version de paquete
    sudo apt-get install dpkg-repack
    dpkg-repack sudo

    dpkg -S /usr/lib/x86_64/libgtk-3-common.so



    dpkg --get-selections  Ver paquetes instalados en el sistema
scp sudo_1.8.21p2-3ubuntu1.6_amd64.deb usuario@otro_servidor:/ruta/destino pragmatic 
    sudo_1.8.21p2-3ubuntu1_amd64.deb  iso viejo

    docker cp <container_id>:/path/to/file/sudo_1.8.21p2-3ubuntu1_amd64.deb .
    docker cp falco-workshop:/sudo_1.8.21p2-3ubuntu1_amd64.deb .

    docker cp falco-workshop:/nano_2.9.3-2_amd64.deb .
    

    


    Dependencias de un paquete: (Librerias)

    ldd /usr/bin/sudo


## Environment variables

    export PATH=$PATH:/usr/local/go/bin
    source ~/.bashrc


    printenv  (ver variables de entorno del sistema)
    set
    export
    unset
    source


    
## Montajes

    m-tools

    sudo mount -o bind /bin/sh /bin/mount


## Privileges

    Toamr del whatsapp

    NOPASSWD  (sudoers)

## Grep

    grep -B 3 -A 5 "Disallowed SSH Connection" falco_rules.yaml
    zgrep


##

