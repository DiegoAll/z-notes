# Git config


3 levels

- system
- global
- local

* Prioridad de configuración

    local > global > system


| Opción    | Alcance                                      | Archivo donde se guarda   |
|-----------|----------------------------------------------|---------------------------|
| --local | Solo el repositorio actual                   | .git/config             |
| --global| Para el usuario actual (todos los repos)     | ~/.gitconfig            |
| --system| Para todos los usuarios del sistema          | /etc/gitconfig          |


* Ver todos los niveles juntos

    git config --list --show-origin


    export LANG=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LC_MESSAGES=en_US.UTF-8

    alias git='LANG=en_US.UTF-8 git'


    alias (validar que haya quedado el alias)
    git clone ...
    alias

    LANG=en_US.UTF-8 git clone git@github.com:<username>/repository.git

Equivalente a:

    export LANG=en_US.UTF-8
    git clone git@github.com:diegoapl/falco-management.git

LANG=en_US.UTF-8 se establece solo para ese proceso que corre git, y no afecta al resto del entorno ni a las siguientes líneas de comandos.


Obtener nformacion del repositorio remoto, sin necesidad de descargarlo (clonarlo) ni de tener una copia local.

    git ls-remote git@github.com:<username>/remoteRepository.git

- Verificar la existencia del repositorio.
- Obtener el hash del ultimo commit en la rama principal.
- Integración con scripts.



