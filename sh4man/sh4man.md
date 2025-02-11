



Validar si systemd esta instalado

    systemctl --version


Comprobar si el sistema está ejecutando systemd

    ps --no-headers -o comm 1  (muestra el proceso PID 1)
    ls -l /sbin/init  (Verificar si el directorio de systemd existe)
    systemctl list-units --type=service


Enumerar Listado de servicios del sistema

    systemctl list-units --type=service




Si systemctl --version y ps --no-headers -o comm 1 confirman la presencia de systemd, entonces tu sistema lo está usando.
Si no, probablemente tengas otro sistema de init como sysvinit, runit o OpenRC
