# Linux pseudoterminal or PTY

> pseudotty, TTY hijacking


Una pseudoterminal (PTY) es una interfaz que emula una terminal física dentro del sistema operativo. Se utiliza para permitir la comunicación entre un proceso (como una shell o un programa) y el usuario a través de una conexión virtual, en lugar de un dispositivo físico como un teclado y un monitor.

Los pseudoterminales consisten en dos partes:

Master (maestro): Es el lado que controla la comunicación y simula el comportamiento de una terminal física.
Slave (esclavo): Es el lado que recibe los datos y actúa como si fuera una terminal normal.
Cuando se ejecuta un programa en un PTY, este no interactúa directamente con el hardware, sino a través del canal virtual del pseudoterminal.



    python3 -c 'import pty; pty.spawn("/bin/bash")'

https://steflan-security.com/






https://indico.egi.eu/event/452/contributions/10516/attachments/10191/11743/20110923-rootkits_tty_hijacking-lyon.pdf



    shopt -q login_shell && echo 'Login shell' || echo 'No login shell' (verificar que archivos carga bash)
    bash --login -x

    chsh -s /bin/bash
