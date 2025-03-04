# sshuttle


    sshuttle -r user@remote_host 0.0.0.0/0 --ssh-cmd "ssh -i /.ssh/gcp_remote"
    sshuttle -r user@remote_host 0.0.0.0/0   (Tunel Completo)
    sshuttle -r user@remote_host 192.168.1.0/24 (Especificar un Rango de IPs o Subredes)
    sshuttle -r user@remote_host 0.0.0.0/0 --udp   (Redirigir Solo Tráfico UDP o TCP)
    sshuttle -r user@remote_host 0.0.0.0/0 --tcp   (Redirigir Solo Tráfico UDP o TCP)
    sshuttle -r user@remote_host 0.0.0.0/0 --ssh-cmd "ssh -i /.ssh/gcp_remote"  (Especificar una Ruta Diferente para la Conexión SSH)
    sshuttle -r user@remote_host:port 0.0.0.0/0  (Usar un Puerto SSH Específico)
    sshuttle -r user@remote_host 0.0.0.0/0 -N 4  (Limitar la Cantidad de Conexiones)
    sshuttle -r user@remote_host 0.0.0.0/0 --dns (Usar un Proxy-Para habilitar el reenvío de consultas DNS a través del túnel)
    sshuttle -r user@remote_host 0.0.0.0/0 --tcp --remote-port 8080 (Redirigir Solo Tráfico TCP de un Puerto Específico)
    sshuttle -r user@remote_host 0.0.0.0/0 --dns   (Redirigir Todo el Tráfico, Incluido el Tráfico DNS)

    sshuttle -L -R


From Debian

    ┌──(root㉿hostname)-[/.ssh]
    └─# sshuttle -r user@remote_host 0.0.0.0/0 --ssh-cmd "ssh -i /.ssh/gcp_remote"
    c : Connected to server.
    Read from remote host remote_host: Connection reset by peer
    client_loop: send disconnect: Broken pipe


From Ubuntu 22.04.5 LTS

    root@pho3nix:/home/diegoall/.ssh/gcp# sshuttle -r diegoposada@34.27.180.215 0.0.0.0/0 --ssh-cmd "ssh -i /home/diegoall/.ssh/gcp/gcp_diegoposada"
    c : Connected to server.
    hola

Aparentemente segun topico es la version del SO.

Validar tun0 es normal que no aparezca,


 





    