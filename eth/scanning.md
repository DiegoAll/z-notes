# Scanning

    while nc -n -vv -z -w3 192.168.1.49 3000 > /dev/null; do echo "Servicio OK"; sleep 1; done; echo "Servicio no responde"; echo -e "\x07"
    while $(nc -n -vv -z -w3 192.168.1.49 3000 > /dev/null); do echo "Servicio OK"; sleep 1; done; echo "Servicio no responde"; echo -e "\x07"
