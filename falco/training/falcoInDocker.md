# Falco in Docker

Depending on your environment, there are multiple ways to deploy Falco as a Docker container.

A least privileged container (recommended) or a fully privileged container.

The standard Falco container image, which will try to install the driver on the host, or the no-driver image, which requires the driver already on the host.

Setting up Falco with an eBPF driver, or running it with no driver; in that case, the driver must be installed on the host.



There are four main steps to install and run Falco with Docker successfully:

Install kernel headers
Install the kernel module
Run Falco
Test Falco


apt search linux-headers-$(uname -r)

apt-get -y install linux-headers-$(uname -r)

apt search linux-headers-$(uname -r)

docker pull falcosecurity/falco-driver-loader:0.37.0
docker run --rm -i -t \
  --privileged \
  -v /root/.falco:/root/.falco \
  -v /proc:/host/proc:ro \
  -v /boot:/host/boot:ro \
  -v /lib/modules:/host/lib/modules:ro \
  -v /usr:/host/usr:ro \
  -v /etc:/host/etc:ro \
  falcosecurity/falco-driver-loader:0.37.0


lsmod | grep falco

The falcosecurity/falco-driver-loader image wraps the falcoctl which is used to install the driver. It checks if a driver already exists and then, it either tries to build the driver on-the-fly or downloads a prebuilt driver. No action is required, but you might see multiple error messages. This is normal, as the script tries various methods to load the drivers until it succeeds.


docker pull falcosecurity/falco-no-driver:0.37.0
docker run --rm -d \
  --name "falco_training" \
  --security-opt apparmor:unconfined \
  -p 8765:8765 \
  -e HOST_ROOT=/ \
  --cap-add SYS_PTRACE \
  --pid=host $(ls /dev/falco* | xargs -I {} echo --device {}) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  falcosecurity/falco-no-driver:0.37.0 \
  /usr/bin/falco -U



The command above runs a docker container named falco_training. It maps the default port for the Falco web server 8765 from the pod to the localhost.



docker pull falcosecurity/falco-driver-loader:0.37.0
docker run -i -t \
  --privileged \
  -v /root/.falco:/root/.falco \
  -v /proc:/host/proc:ro \
  -v /boot:/host/boot:ro \
  -v /lib/modules:/host/lib/modules:ro \
  -v /usr:/host/usr:ro \
  -v /etc:/host/etc:ro \
  falcosecurity/falco-driver-loader:0.37.0


docker pull falcosecurity/falco-no-driver:0.37.0
docker run -d \
  --name "falco_training" \
  --security-opt apparmor:unconfined \
  -p 8765:8765 \
  -e HOST_ROOT=/ \
  --cap-add SYS_PTRACE \
  --pid=host $(ls /dev/falco* | xargs -I {} echo --device {}) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  falcosecurity/falco-no-driver:0.37.0 \
  /usr/bin/falco -U


Esto instala el diver a traves de un contenedor

Validar el comando falco -U


root@master:~# docker ps
CONTAINER ID   IMAGE                                  COMMAND               CREATED         STATUS         PORTS                                       NAMES
b4e05c7c3cc8   falcosecurity/falco-no-driver:0.37.0   "/usr/bin/falco -U"   3 seconds ago   Up 3 seconds   0.0.0.0:8765->8765/tcp, :::8765->8765/tcp   falco_training


docker logs falco_training


find /root -name "id_rsa"


docker logs falco_training 2>&1 | grep "find /root -name id_rsa"


NO SE PASA DE TERMINAL



root@master:~# tty
/dev/pts/2
root@master:~# ps -a | grep tty
root@master:~# w
 04:21:15 up 27 min,  0 users,  load average: 0.00, 0.02, 0.06
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root@master:~# sudo chvt 3
root@master:~# which chvt
/usr/bin/chvt
root@master:~# docker logs falco_training 2>&1 | grep "find /root -name id_rsa"
2024-08-29T04:15:12.385963060+0000: Warning Grep private keys or passwords activities found (evt_type=execve user=root user_uid=0 user_loginuid=-1 process=find proc_exepath=/usr/bin/find parent=bash command=find /root -name id_rsa terminal=34818 exe_flags=EXE_WRITABLE container_id=host container_name=host)
root@master:~# sudo openvt -s -w -- tty3 bash
root@master:~# docker ps
CONTAINER ID   IMAGE                                  COMMAND               CREATED          STATUS          PORTS                                       NAMES
b4e05c7c3cc8   falcosecurity/falco-no-driver:0.37.0   "/usr/bin/falco -U"   11 minutes ago   Up 11 minutes   0.0.0.0:8765->8765/tcp, :::8765->8765/tcp   falco_training
root@master:~# which openvt
/usr/bin/openvt
root@master:~# sudo openvt -s -w -- tty3 bash
root@master:~# sudo openvt -s -w -- tty5 bash
root@master:~# w
 04:23:13 up 29 min,  0 users,  load average: 0.14, 0.08, 0.08
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root@master:~# tty
/dev/pts/2