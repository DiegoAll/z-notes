# Git


    hay un git para sobrescribir commit  name


    $ git tag -l 'v1.8.5*'    v1.8.5-rc0




    git merge --allow-unrelated-histories origen/main


    git push origin HEAD --force-with-lease



    ssh -T git@github.com


    git reset --hard HEAD

    git ls-remote --heads origin  Ver ramas disponibles en el repositorio remoto

    Squash and Merge


    git checkout --values.yaml (Descartar cambios)


    git remote add origin git@github.com-rahul-personal:rahul-personal
    git remote add origin git@github.com-rahul-office:rahul-office


    git remote add origin https://github.com/DiegoAll/rat-bhg.git
    git remote add origin https://github.com/DiegoAll/rat-bhg.git

    git remote add origin git@github.diegoall:DiegoAll/rat-bhg.git
    git remote add origin git@github.diego-all:diego-all/evergreen-con.git  (esta funciono para evergreen)

    git remote add origin git@github.diegoall:diegoall/rat-bhg.git

    git remote rm origin
    


    git@github.diegoall:DiegoAll/rat-bhg.git



    (Busqueda)

    git log --since="2021-01-01" --until="2021-12-31"

    git log -S "Por Contenido"   una línea de código que coincida con una cadena de texto especificada


    git grep [opciones] [patrón] [--] [archivos]     se utiliza para buscar patrones en los archivos de un repositorio

    [opciones] son las opciones que se pueden usar para ajustar el comportamiento de la búsqueda. Algunas de las opciones comunes son:

    -i: hace que la búsqueda sea insensible a mayúsculas y minúsculas.
    -n: muestra el número de línea de cada coincidencia.
    -w: busca solo palabras completas que coincidan con el patrón.
    -v: muestra las líneas que no coinciden con el patrón.
    [patrón] es el patrón que se desea buscar.

    -- es una señal que indica el final de las opciones. Esto se utiliza para evitar confusiones entre opciones y nombres de archivo que empiezan con guiones.

    [archivos] son los archivos en los que se desea realizar la búsqueda. Si no se especifican archivos, Git buscará en todos los archivos del repositorio.


    git stash list
    git stash -u


## Referencias

    https://git-scm.com/book/es/v2/Fundamentos-de-Git-Etiquetado


