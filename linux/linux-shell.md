# Linux shell


Esoteric command line kung-fu bits

    compgen -b | pr -5 -t; echo "Count: $(compgen -b | wc -l)"


Lista todos los builtins disponibles en al sesión de shell actual.
Builtins son comando internos de bash que se ejecutan directamente en el interprete de comandos sin invocar un programa externo. (Ej cd, echo, read, exit, etc)
