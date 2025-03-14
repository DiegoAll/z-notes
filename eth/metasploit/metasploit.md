# metasploit


    https://github.com/phocean/dockerfile-msf

    docker build -t phocean/msf .



docker run --rm -i -t -p 9990-9999:9990-9999 -v $HOME/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data --name msf phocean/msf

    Note that this can be risky as all services on your host, including those that listen on localhost, would be reachable from within the container, in case it is compromise.

docker run --rm -it --net=host --hostname msf -v $HOME/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data --name msf phocean/msf




    docker run --rm -it -v msf-db:/var/lib/postgresql metasploit

    docker run --rm -it -v msf-db:/var/lib/postgresql parrotsec/metasploit







