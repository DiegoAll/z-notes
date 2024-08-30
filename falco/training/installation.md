# Installation


Falco Installation
Falco is available for multiple environments. This track covers various installation methods in the next step.

After the installation, we will cover the post-install tasks: where config files are stored and how to do basic troubleshooting.

After this track, you should be able to set up and manage Falco on various workspaces.


Ubuntu 20.04


curl -s https://falco.org/repo/falcosecurity-packages.asc | apt-key add -
echo "deb https://download.falco.org/packages/deb stable main" \ | tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update

apt search linux-headers-$(uname -r)

apt-get -y install linux-headers-$(uname -r)

apt-get install -y falco=0.37.0

falcoctl driver install

    root@master:~# falcoctl driver install
    2024-08-29 03:40:27 INFO  Running falcoctl driver install
                        ├ driver version: 7.0.0+driver
                        ├ driver type: kmod
                        ├ driver name: falco
                        ├ compile: true
                        ├ download: true
                        ├ arch: x86_64
                        ├ kernel release: 5.15.0-1049-gcp
                        └ kernel version: #57~20.04.1-Ubuntu SMP Wed Jan 17 16:04:23 UTC 2024
    2024-08-29 03:40:27 INFO  Found distro target: ubuntu-gcp
    2024-08-29 03:40:27 INFO  Check if kernel module is still loaded.                                                                                                         
    2024-08-29 03:40:27 INFO  OK! There is no module loaded. 
    2024-08-29 03:40:27 INFO  Check all versions of kernel module in dkms. 
    2024-08-29 03:40:27 INFO  OK! There are no module versions in dkms. 
    2024-08-29 03:40:27 INFO  Trying to download a driver.                                                                                                                    
                        └ url: https://download.falco.org/driver/7.0.0%2Bdriver/x86_64/falco_ubuntu-gcp_5.15.0-1049-gcp_57~20.04.1.ko
    2024-08-29 03:40:27 INFO  Driver downloaded. path: /root/.falco/7.0.0+driver/x86_64/falco_ubuntu-gcp_5.15.0-1049-gcp_57~20.04.1.ko
    2024-08-29 03:40:27 INFO  Success: module found and loaded in dkms.
                        └ driver: /root/.falco/7.0.0+driver/x86_64/falco_ubuntu-gcp_5.15.0-1049-gcp_57~20.04.1.ko


QUIZAS CARGAR UN ROOTKIT LKM PUEDA FUNCIONAR EN GKE; PODRIAN SER COMPATIBLES.
RECORDAR QUE NUNCA INTENTE COMPILARLO Y ENVIARLO COMPILADO.

falco


Once Falco is installed, the kernel module drivers run with the default configuration.

By default, Falco sends its logs to Syslog. You can read the Falco logs on "Terminal 1" or with the command below on "Terminal 2":

grep falco /var/log/syslog


# Test Falco


find /root -name "id_rsa"

grep falco /var/log/syslog | grep "find /root -name id_rsa"


    kill -1 $(cat /var/run/falco.pid)
