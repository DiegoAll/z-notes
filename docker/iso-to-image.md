# ISO to Docker Image

> filesystem.squashfs (Dilema encontrar esto, varia de acuerdo a cada distro)

https://www.techrepublic.com/videos/how-to-convert-an-iso-to-a-docker-image/


    apt-get install squashfs-tools -y

    mkdir rootfs unsquashfs
    sudo mount -o loop ~/<path>.iso ~/roots
    sudo mount -o loop /home/diegoall/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso.iso ~/rootfs

    mkdir rootfs unsquashfs
    sudo mount -o loop /home/diegoall/FALCO/falco-workshop/ubuntu-24.04-desktop-amd64.iso /home/diegoall/rootfs

    sudo umount ~/rootfs
    rm -r ~/rootfs ~/unsquashfs



    root@pho3nix:/home/diegoall# mount -o loop /home/diegoall/FALCO/falco-workshop/debian-10.7.0-amd64-DVD-1.iso /home/diegoall/rootfs/
    mount: /home/diegoall/rootfs: WARNING: source write-protected, mounted read-only.


    cd rootfs

    find . -type f | grep filesystem.squashfs

    sudo unsquashfs/ rootf/casper/filesystem.squashfs NO FUNCIONA
    sudo unsquashfs/ rootf/casper/filesystem.squashfs


    unsquashfs rootf/casper/filesystem.squashfs




List of Commands:

sudo apt-get install squashfs-tools -y
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
mkdir rootfs unsquashfs
sudo mount -o loop ~/Downloads/ubuntu-20.04-live-server-amd64.iso ~/rootfs
cd ~/rootfs
find . -type f | grep filesystem.squashfs
cd ~/
sudo unsquashfs -f -d unsquashfs/ rootfs/casper/filesystem.squashfs
sudo tar -C unsquashfs -c . | docker import - IMAGENAME/TAG
docker images



## References

    https://www.youtube.com/watch?v=3lHGwrshnb4&t=146s

    https://www.techrepublic.com/videos/how-to-convert-an-iso-to-a-docker-image/







sudo unsquashfs -f -d unsquashfs/ rootfs/casper/filesystem.squashfs
sudo tar -C unsquashfs -c . | docker import - IMAGENAME/TAG

DIEGO minimal.squashfs

sudo unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.standard.squashfs


unsquashfs -f -d unsquashfs/ /home/diegoall/rootfs/casper/minimal.standard.squashfs  FUNCIONO
tar -C unsquashfs -c . | docker import - diegoall/ubuntu-24.04-desktop-amd64.iso/0.0.1   FUNCIONO





filesystem.squashfs
