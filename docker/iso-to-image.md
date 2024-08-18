# ISO to Docker Image


https://www.techrepublic.com/videos/how-to-convert-an-iso-to-a-docker-image/


    apt-get install squashfs-tools -y


    mkdir rootfs unsquashfs

    sudo mount -o loop ~/<path>.iso ~/roots


    sudo mount -o loop ~/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso.iso ~/rootfs



    root@pho3nix:/home/diegoall# mount -o loop /home/diegoall/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso /home/diegoall/rootfs/
    mount: /home/diegoall/rootfs: WARNING: source write-protected, mounted read-only.


    cd rootfs

    find . -type f | grep filesystem.squashfs

    sudo unsquashfs/ rootf/casper/filesystem.squashfs




