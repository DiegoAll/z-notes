# Go get-install


Cuando instalas una aplicación Go usando go get o go install, esta se compila y, si es una aplicación que tiene una función main, el binario resultante se coloca en el directorio GOPATH/bin (que comúnmente es ~/go/bin). Este binario puede ser ejecutado directamente desde la línea de comandos como cualquier otro comando del sistema.

Cómo funciona:
Compilación y Instalación:

Cuando ejecutas go get github.com/usuario/aplicacionA, Go descarga el código fuente de aplicacionA desde GitHub, lo compila y lo instala si es necesario.
Si la aplicación tiene un archivo main.go con una función main, se compilará como un ejecutable y se colocará en GOPATH/bin.
Ubicación del Binario:

El binario resultante de la compilación se coloca en GOPATH/bin (por defecto ~/go/bin).
Al agregar GOPATH/bin a tu variable de entorno PATH, puedes ejecutar el binario desde cualquier ubicación en la terminal como si fuera un comando del sistema.
Ejecutar el Binario:

Una vez instalado, puedes ejecutar la aplicación simplemente escribiendo su nombre en la línea de comandos, por ejemplo, go-fuzz, sin tener que especificar la ruta completa al binario.
Pasos para crear una aplicación de este estilo:
Estructura del Proyecto:

Crea una estructura de proyecto estándar en Go con un archivo main.go.
main.go debe contener la función main, que es el punto de entrada de la aplicación.
Compilación e Instalación:

Si estás desarrollando una aplicación que quieres distribuir de esta forma, asegúrate de que otros puedan instalarla usando go get o go install.
Publica tu código en un repositorio público (por ejemplo, GitHub).
Uso de go install:

Desde Go 1.17, se recomienda usar go install en lugar de go get para instalar binarios.
Puedes ejecutar go install github.com/usuario/aplicacionA@latest para instalar la última versión del binario.
Distribución:

Si quieres que otros puedan usar tu aplicación como un binario, asegúrate de que tu código fuente sea accesible, y que los usuarios tengan su GOPATH/bin en su PATH.


## Ejemplo de una Aplicación Simple:


    // main.go
    package main

    import (
        "fmt"
    )

    func main() {
        fmt.Println("Hello, World!")
    }

Compila e Instala:

Alguien puede instalar esta aplicación con go install github.com/tu-usuario/tu-app@latest.
El binario tu-app se instalará en ~/go/bin.
Ejecuta el Binario:

El usuario puede ejecutar la aplicación escribiendo tu-app en la terminal.
Siguiendo estos pasos, puedes crear aplicaciones en Go que se puedan instalar y usar como binarios desde la línea de comandos.