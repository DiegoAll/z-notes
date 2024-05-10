# GitHub config
  

## Generar las llaves SHH


    ssh-keygen -t rsa -b 4096 -C "dposadallano@hotmail.com"
    /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux


Por temas de esta documentación Error: Permiso denegado (publickey) recomiendan lo siguiente:

~~~
¿Se debe usar el comando sudo o los privilegios elevados con Git?
No debería utilizar el comando sudo con Git, ni los privilegios elevados, tales como los permisos de administrador. Si tiene un motivo muy fundado, debe usar sudo y, después. asegurarse de que lo está usando con cada comando (probablemente sea mejor usar su para obtener un shell como raíz en ese momento). Si genera claves SSH sin sudo e intenta usar un comando como sudo git push, no estará usando las mismas claves que ha generado.
~~~

En Ubuntu no puedo ejecutar nada de git sin elevar privilegios (Investigar)
**Entonces decido copiar tanto las llaves y el archivo config en /root**



## Configuración

~~~
root@pho3nix:/home/diegoall/private-test# more ~/.ssh/config 
 Github Personal Linux
Host github.diegoall
HostName github.com
User diegoall
#IdentityFile ~/.ssh/diegoall/id_rsa_diego58229_linux


# Github Personal 3: diego-all (dposadallano@hotmail.com)
Host github.diego-all
HostName github.com
User diegoall
IdentityFile ~/.ssh/diego-all/id_rsa_dposadallano-hot_linux
~~~
  
    eval `ssh-agent`
    ssh-add /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux
    ssh-add -l

## Utilizando Pull

Fue necesario pullear para que quedaran configurados los remotos


    git clone git@github.com:diego-all/private-test.git

Para probar:

    ssh -vT git@github.diego-all

~~~
root@pho3nix:/home/diegoall/private-test# ssh -vT git@github.diego-all
OpenSSH_8.9p1 Ubuntu-3ubuntu0.6, OpenSSL 3.0.2 15 Mar 2022
debug1: Reading configuration data /root/.ssh/config
debug1: /root/.ssh/config line 9: Applying options for github.diego-all
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: include /etc/ssh/ssh_config.d/*.conf matched no files
debug1: /etc/ssh/ssh_config line 21: Applying options for *
debug1: Connecting to github.com [140.82.112.4] port 22.
debug1: Connection established.
debug1: identity file /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux type 0
debug1: identity file /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.6
debug1: Remote protocol version 2.0, remote software version babeld-05989c77
debug1: compat_banner: no match: babeld-05989c77
debug1: Authenticating to github.com:22 as 'git'
debug1: load_hostkeys: fopen /root/.ssh/known_hosts2: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts2: No such file or directory
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ssh-ed25519
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: SSH2_MSG_KEX_ECDH_REPLY received
debug1: Server host key: ssh-ed25519 SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU
debug1: load_hostkeys: fopen /root/.ssh/known_hosts2: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts2: No such file or directory
debug1: Host 'github.com' is known and matches the ED25519 host key.
debug1: Found key in /root/.ssh/known_hosts:1
debug1: ssh_packet_send2_wrapped: resetting send seqnr 3
debug1: rekey out after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: ssh_packet_read_poll2: resetting read seqnr 3
debug1: SSH2_MSG_NEWKEYS received
debug1: rekey in after 134217728 blocks
debug1: get_agent_identities: bound agent to hostkey
debug1: get_agent_identities: agent returned 1 keys
debug1: Will attempt key: /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux RSA SHA256:11+075xCj+t1ZcZ4pXI5KJOHq8gOyNCLO49ofHACv08 explicit agent
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp256-cert-v01@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,sk-ecdsa-sha2-nistp256-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,sk-ecdsa-sha2-nistp256@openssh.com,ssh-ed25519,ecdsa-sha2-nistp521,ecdsa-sha2-nistp384,ecdsa-sha2-nistp256,rsa-sha2-512,rsa-sha2-256,ssh-rsa>
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering public key: /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux RSA SHA256:11+075xCj+t1ZcZ4pXI5KJOHq8gOyNCLO49ofHACv08 explicit agent
debug1: Server accepts key: /root/.ssh/diego-all/id_rsa_dposadallano-hot_linux RSA SHA256:11+075xCj+t1ZcZ4pXI5KJOHq8gOyNCLO49ofHACv08 explicit agent
Authenticated to github.com ([140.82.112.4]:22) using "publickey".
debug1: channel 0: new [client-session]
debug1: Entering interactive session.
debug1: pledge: filesystem
debug1: client_input_global_request: rtype hostkeys-00@openssh.com want_reply 0
debug1: client_input_hostkeys: searching /root/.ssh/known_hosts for github.com / (none)
debug1: client_input_hostkeys: searching /root/.ssh/known_hosts2 for github.com / (none)
debug1: client_input_hostkeys: hostkeys file /root/.ssh/known_hosts2 does not exist
debug1: client_input_hostkeys: no new or deprecated keys from server
debug1: Sending environment.
debug1: channel 0: setting env LANG = "es_CO.UTF-8"
debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
Hi diego-all! You've successfully authenticated, but GitHub does not provide shell access.
debug1: channel 0: free: client-session, nchannels 1
Transferred: sent 3596, received 3096 bytes, in 0.2 seconds
Bytes per second: sent 20311.6, received 17487.4
debug1: Exit status 1
~~~


    git config --global init.defaultBranch main
    git config --global user.email "dposadallano@gmail.com"
    git config --global user.name "Diego Alejandro Posada Llano"

    Se pueden modificar luego desde el archivo.

    git config --local user.email "dposadallano@hotmail.com"
    git config --local user.name "Diego Alejandro Posada Llano"




## Ahora de forma local configurando los remotos:

    git remote add origin git@github.diego-all:diego-all/ggolang-scaffolding-minimal.git


En alguna ocacion utilice esto:

git push --set-upstream origin main
o con git push sin git push -u origin main obtuve un mensaje de error diferente
Al parecer el lenguaje de git es del sistema operativo base. Aunque no me cuadra con los mac, setie un alias en .bashrc


Recordar siempre hacer fetch o git pull
No usar git pull -f que genera un mensaje molesto y es necesario usar -f siempre.


    git pull origin master --allow-unrelated-histories


    git config --global --edit


    hay en KNOWLEDGE-REPO y en OVERLEAF



git remote add origin git@github.diego-all:diego-all/golang-scaffolding-minimal.git
