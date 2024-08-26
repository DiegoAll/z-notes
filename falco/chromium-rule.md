# Chromium rule



> Escenario adecuado con draios en Kubernetes (Problema del driver)
> Por ende se utiliza en Docker, no es lo mismo.
> Seria lo mas apropiado para comenzar a inspeccionar los pods.

Es una utilidad que ejecuta comandos de este tipo: ps -ax -o pid=, ppid=,pcpu=,pmem,command=     cada ciertos segundos.
Es similar a un htop, con la diferencia que se puede explorar dentro de una selección.


- Mejor entrar por csysdig, tiene unos menus: Connections, Containers, Directories, Errores, New connections, Processes, System Calls etc.

- Atras con tecla backspace. 


**Ejemplo: Connections**

Filtro: fd.type=ipv4 

F5: Echo (se the payloads)

F2: View as (Printable ASCII, Hex, Dotted ASCII)


**Ejemplo: Contenedores**

Situarse el el nombre del contenedor

F8 actions


**Ejemplo: Directories (Top directories)**


**Ejemplo: Errors**

    ENOENT

F6 Dig Ver las syscalls para corroborar que esta pasando.



- Ben comandos v8 (es lo mismo que entrar modo developer o algo asi)

    https://v8.dev/docs

    how works
    
    https://medium.com/@rodcast/v8-javascript-engine-understanding-javascript-api-requests-and-responses-in-the-data-fetching-311481bdae6a







