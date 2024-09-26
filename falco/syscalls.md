# Syscalls



    man syscalls




Parece que hay raw syscalls





Tomado de:

https://www.oreilly.com/library/view/practical-cloud-native/9781098118563/ch04.html 


| Categoría | Ejemplos                                                                                                                                                                                                                                                                                       |
|---|---|
| E/S de archivos | open, creat, close, read, write, ioctl, link, unlink, chdir, chmod, stat, seek, mount, rename, mkdir, rmdir                                                                                                                                                  |
| Redes        | socket, bind, connect, listen, accept, sendto, recvfrom, getsockopt, setsockopt, shutdown                                                                                                                                                              |
| Comunicación entre procesos | pipe, futex, inotify_add_watch, eventfd, semop, semget, semctl, msgctl                                                                                                                                                                    |
| Gestión de procesos       | clone, execve, fork, nice, kill, prctl, exit, setrlimit, setpriority, capset                                                                                                                                                                 |
| Gestión de memoria       | brk, mmap, mprotect, mlock, madvise                                                                                                                                                                                                        |
| Gestión de usuarios       | setuid, getuid, setgid, getgid                                                                                                                                                                                                             |
| Sistema        | sethostname, setdomainname, reboot, syslog, uname, swapoff, init_module, delete_module                                                                                                                                                           |