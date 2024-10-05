# File systems


    root@pho3nix:/etc/modprobe.d# lsmod | grep fuse
    root@pho3nix:/etc/modprobe.d# ps aux | grep fuse
    root        5592  0.0  0.0   2796  1792 ?        Ss   sep25   0:00 fusermount3 -o rw,nosuid,nodev,fsname=portal,auto_unmount,subtype=portal -- /run/user/1000/doc
    diegoall    6099  0.0  0.0 380896  6144 ?        Sl   sep25   0:00 /usr/libexec/gvfsd-fuse /run/user/1000/gvfs -f
    root     2670347  0.0  0.0  11828  2688 pts/52   S+   22:26   0:00 grep --color=auto fuse


Tengo un sistema de archivos fusermount

Relacionado con FUSE tecnica de explotacion.