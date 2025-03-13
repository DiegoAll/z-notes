# Test protocol

    date && echo "Hora colombiana:" && curl -s http://worldtimeapi.org/api/timezone/America/Bogota | jq '.datetime'

    ifconfig | grep -A 1 "utun4"

    grep -A 1 "utun4" | grep -A 1 "tun4"
    ifconfig | awk '/utun4/{print; getline; print}'

    

