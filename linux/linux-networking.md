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

    curl ifconfig.me

    ip addr
    ip a
    hostname -I
    

## tcpdump


    tcpdump -i eth0 -nn -e

    


## Connections

    REVERSE_IP=$(hostname -I | tr -d " ")

    