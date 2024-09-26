
https://github.com/draios/sysdig


Acabo de levantar un contenedor de forma local con este comando:


sudo docker run -i -t --name draios --privileged --net=host \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /src:/src \
    -v /lib/modules:/host/lib/modules:ro \
    -v /usr:/host/usr:ro \
    -v /etc:/host/etc:ro \
    docker.io/sysdig/sysdig

Requiero ahora desplegarlo en kubernetes especificamente en EKS.

Podrias ayudarme a escribir un manifiesto para esto.

Realmente para poder funcionar local requiere un driver llamado scap. Este modulo se compila utilizando kernel-headers. como puedes ver en este log:

diegoall@pho3nix:~/FALCO/bootstrap-5.3.3-examples$ sudo docker run -i -t --name draios --privileged --net=host \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /src:/src \
    -v /lib/modules:/host/lib/modules:ro \
    -v /usr:/host/usr:ro \
    -v /etc:/host/etc:ro \
    docker.io/sysdig/sysdig
* Setting up /usr/src links from host
* Running scap-driver-loader for: driver version=7.2.0+driver, arch=x86_64, kernel release=6.8.0-45-generic, kernel version=45
* Running scap-driver-loader with: driver=module, compile=yes, download=yes

================ Cleaning phase ================

* 1. Check if kernel module 'scap' is still loaded:
- Kernel module 'scap' is still loaded.
- Trying to unload it with 'rmmod scap'...
- OK! Unloading 'scap' module succeeded.

* 2. Check all versions of kernel module 'scap' in dkms:
- There are some versions of 'scap' module in dkms.

* 3. Removing all the following versions from dkms:
7.2.0+driver

- Removing 7.2.0+driver...

------------------------------
Deleting module version: 7.2.0+driver
completely from the DKMS tree.
------------------------------
Done.

- OK! Removing '7.2.0+driver' succeeded.


[SUCCESS] Cleaning phase correctly terminated.

================ Cleaning phase ================

* Looking for a scap module locally (kernel 6.8.0-45-generic)
* Filename 'scap_ubuntu-core_6.8.0-45-generic_45.ko' is composed of:
 - driver name: scap
 - target identifier: ubuntu-core
 - kernel release: 6.8.0-45-generic
 - kernel version: 45
* Trying to download a prebuilt scap module from https://download.sysdig.com/scap-drivers/7.2.0%2Bdriver/x86_64/scap_ubuntu-core_6.8.0-45-generic_45.ko
curl: (22) The requested URL returned error: 404 
Unable to find a prebuilt scap module
install: /usr/lib/gcc/x86_64-redhat-linux/8/
* Trying to dkms install scap module with GCC /usr/bin/gcc
DIRECTIVE: MAKE="'/tmp/scap-dkms-make'"

Creating symlink /var/lib/dkms/scap/7.2.0+driver/source ->
                 /usr/src/scap-7.2.0+driver

DKMS: add completed.

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area...
'/tmp/scap-dkms-make'...(bad exit status: 2)
* Running dkms build failed, dumping /var/lib/dkms/scap/7.2.0+driver/build/make.log (with GCC /usr/bin/gcc)
DKMS make.log for scap-7.2.0+driver for kernel 6.8.0-45-generic (x86_64)
Thu Sep 26 07:04:58 UTC 2024
'/tmp/scap-dkms-make' -C /lib/modules/6.8.0-45-generic/build M=/var/lib/dkms/scap/7.2.0+driver/build modules
make[1]: Entering directory '/host/usr/src/linux-headers-6.8.0-45-generic'
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0
  You are using:           gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)
[configure-kmod] Including /var/lib/dkms/scap/7.2.0+driver/build//configure/CLASS_CREATE_1/Makefile.inc /var/lib/dkms/scap/7.2.0+driver/build//configure/DEVNODE_ARG1_CONST/Makefile.inc /var/lib/dkms/scap/7.2.0+driver/build//configure/ACCESS_OK_2/Makefile.inc
[configure-kmod] Build output for HAS_CLASS_CREATE_1:
[configure-kmod] make: Entering directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1' make -C /host/usr/src/linux-headers-6.8.0-45-generic M=/var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1 modules make[1]: Entering directory '/host/usr/src/linux-headers-6.8.0-45-generic' warning: the compiler differs from the one used to build the kernel   The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0   You are using:           gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)   CC [M]  /var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1/test.o gcc: error: unrecognized command line option '-ftrivial-auto-var-init=zero' gcc: error: unrecognized command line option '-fzero-call-used-regs=used-gpr' make[3]: *** [scripts/Makefile.build:243: /var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1/test.o] Error 1 make[2]: *** [/host/usr/src/linux-headers-6.8.0-45-generic/Makefile:1925: /var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1] Error 2 make[1]: *** [Makefile:240: __sub-make] Error 2 make[1]: Leaving directory '/host/usr/src/linux-headers-6.8.0-45-generic' make: *** [Makefile:15: all] Error 2 make: Leaving directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/CLASS_CREATE_1'
[configure-kmod] Build output for HAS_DEVNODE_ARG1_CONST:
[configure-kmod] make: Entering directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST' make -C /host/usr/src/linux-headers-6.8.0-45-generic M=/var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST modules make[1]: Entering directory '/host/usr/src/linux-headers-6.8.0-45-generic' warning: the compiler differs from the one used to build the kernel   The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0   You are using:           gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)   CC [M]  /var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST/test.o gcc: error: unrecognized command line option '-ftrivial-auto-var-init=zero' gcc: error: unrecognized command line option '-fzero-call-used-regs=used-gpr' make[3]: *** [scripts/Makefile.build:243: /var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST/test.o] Error 1 make[2]: *** [/host/usr/src/linux-headers-6.8.0-45-generic/Makefile:1925: /var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST] Error 2 make[1]: *** [Makefile:240: __sub-make] Error 2 make[1]: Leaving directory '/host/usr/src/linux-headers-6.8.0-45-generic' make: *** [Makefile:15: all] Error 2 make: Leaving directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/DEVNODE_ARG1_CONST'
[configure-kmod] Build output for HAS_ACCESS_OK_2:
[configure-kmod] make: Entering directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2' make -C /host/usr/src/linux-headers-6.8.0-45-generic M=/var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2 modules make[1]: Entering directory '/host/usr/src/linux-headers-6.8.0-45-generic' warning: the compiler differs from the one used to build the kernel   The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0   You are using:           gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22)   CC [M]  /var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2/test.o gcc: error: unrecognized command line option '-ftrivial-auto-var-init=zero' gcc: error: unrecognized command line option '-fzero-call-used-regs=used-gpr' make[3]: *** [scripts/Makefile.build:243: /var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2/test.o] Error 1 make[2]: *** [/host/usr/src/linux-headers-6.8.0-45-generic/Makefile:1925: /var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2] Error 2 make[1]: *** [Makefile:240: __sub-make] Error 2 make[1]: Leaving directory '/host/usr/src/linux-headers-6.8.0-45-generic' make: *** [Makefile:15: all] Error 2 make: Leaving directory '/var/lib/dkms/scap/7.2.0+driver/build/configure/ACCESS_OK_2'
  CC [M]  /var/lib/dkms/scap/7.2.0+driver/build/main.o
gcc: error: unrecognized command line option '-ftrivial-auto-var-init=zero'
gcc: error: unrecognized command line option '-fzero-call-used-regs=used-gpr'
make[3]: *** [scripts/Makefile.build:243: /var/lib/dkms/scap/7.2.0+driver/build/main.o] Error 1
make[2]: *** [/host/usr/src/linux-headers-6.8.0-45-generic/Makefile:1925: /var/lib/dkms/scap/7.2.0+driver/build] Error 2
make[1]: *** [Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/host/usr/src/linux-headers-6.8.0-45-generic'
make: *** [Makefile:22: all] Error 2
* Trying to load a system scap module, if present
* Success: scap module found and loaded with modprobe

Se debe considerar que la version del kernel: 5.10.192-183.736.amzn2.x86_64 esta es la version del kernel que hay en el nodo.

Podrias construir el manifiesto y darme la respuesta en español