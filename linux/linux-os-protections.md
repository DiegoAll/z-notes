# Linux OS-protections



https://github.com/moby/moby/issues/31050


To check for partial RELRO, expect to see output from these commands:
    
    readelf -l /usr/bin/dockerd | grep 'GNU_RELRO'
    readelf -l /usr/bin/docker-containerd | grep 'GNU_RELRO'

To check for full RELRO, expect to see output from:
    
    readelf -d /usr/bin/dockerd | grep 'BIND_NOW'
    readelf -d /usr/bin/docker-containerd | grep 'BIND_NOW'

To check for PIE and stack canaries:
    Use the hardening-check tool (available in Fedora repos). hardening-includes package in Ubuntu repos.
    ➜  $ hardening-check $(which dockerd)
    /usr/bin/dockerd:
    Position Independent Executable: no, normal executable!
    Stack protected: no, not found!
    Fortify Source functions: no, only unprotected functions found!
    Read-only relocations: yes
    Immediate binding: no, not found!


