# Express

## Step 1: Enviroment preparation & Good practices (Linters)

Configuracion inicial para un proyecto en nodejs.

inside my-store

    npm init -y  (default configuration creates package.json file)

    Without -y custom configuration

    touch .gitignore
    touch .editorconfig
    touch .eslintrc.json
    touch index.js

EditorConfig for VS Code

In package json:

    "dev": "nodemon index.js",
    "start": "node index.js",
    "lint": "eslint"

Good practices:

    npm i nodemon eslint eslint-config-prettier eslint-plugin-prettier pritter -D

Execution:

    npm run dev   (Development)
    npm run start (Production)



## Step 2: Install express as production dependency (Different to dev dependencies)

    npm i express



### Plugins

Instalar ESLint desde las extensiones de VSCode.


### References

<https://expressjs.com/>



