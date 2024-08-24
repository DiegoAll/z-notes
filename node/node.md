# Node

## Instalación

Se puede instalar desde terminal o desde la web se genera el codigo para instalarlo. Aqui <https://nodejs.org/en/download/package-manager>

    # installs nvm (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    # download and install Node.js (you may need to restart the terminal)
    nvm install 20
    # verifies the right Node.js version is in the environment
    node -v # should print `v20.17.0`
    # verifies the right npm version is in the environment
    npm -v # should print `10.8.2`


A manolete

    apt-get install -y nodejs npm
    node -v
    npm -v

En Mac

    brew install npm
    npm --version

Actualizar npm:

    npm install -g npm@9.8.1

Trevor recomienda version LTS, MELI proporciona v20.0 (Descargar e instalar el *.pkg)

    nodejs.org/es
    node --version


## Ejecutar aplicación
   
Dentro de la carpeta del proyecto
   
    npm install
    npm install --verbose

Development server

    nodemon

Si es una aplicacion express

    node app.js

Validar problemas de red

    curl -I https://registry.npmjs.org/


## vue-app

    npm run serve

Buscar en NOTES.md los otros ...



## Para utilizar la de Trevor

    npm install
    npm run serve



## Hacer el build para producción

    npm run build


