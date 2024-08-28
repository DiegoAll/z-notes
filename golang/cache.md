# Cache


Go build cache  (cache de compilacion)

    go env cache 
    go clean

https://www.adityathebe.com/how-to-clean-go-build-cache/


    go clean -modcache

Este comando elimina los paquetes que se han descargado, es decir los de la ruta:

    cd $GOPATH/pkg/mod

