# Linux fundamentals



## Information

        arch
        lsb_release -a  version
        /cat/etc/issue version exacta del SO


## Shells

    /etc/shell
    chsh -s /bin/bash  (Cambiar la shell de un usuario)
  


bas, rbash (restricted bash)

subshell echo "$(</etc/shadow)"


vaina del mount (Escalar")



## Install packages

- Instalar aplicaciones

    apt-get --only-upgrade install sudo
    hay uno con mark para que no actualice cierto paquete.
    apt install -fy ./rustdesk-1.2.7-x86_64.deb (cuando falla dpkg -i)
    hay otro que busca los paquetes y dependencias.

    dpkg --get-selections  Ver paquetes instalados en el sistema

    



## Privileges



