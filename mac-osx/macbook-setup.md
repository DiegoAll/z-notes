# Macbook


Detalles okta -jamf connect -

## Brew

    brew.sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    ==> Next steps:
    - Run these commands in your terminal to add Homebrew to your PATH:
        echo >> /Users/dposada/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dposada/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"

    brew help
    source ~/.zprofile
    source ~/.bash_profile

    brew update
    brew upgrade


## iTerm2

    CMD + , (settings)
    Profiles , Command , /bin/bash

## Terminal

    Pro (Set as default)
    ls /bin  ; ls /sbin


## Kubernetes Clusters

    brew install helm
    brew install kubectl; brew info kubectl; command -v kubectl
    brew install kubernetes-cli
    brew install kubectx
    brew install kubelogin (OIDC bases authentication (OpenID Connect).)  [kubectx|kubens]
    brew install eksctl

    falta [k]


    awscli

    aws identity center
    https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html (console access) (INstall 4 all users)
    /usr/local/aws-cli

    aws configure sso (choose account, role & profile)
    aws sso login --profile <ProfileName>

    echo $KUBECONFIG
    ~/.kube/config

    kubectl config get-contexts
    kubectl config use-context <nombre-del-contexto>

    kubectl oidc-login setup \ ...

    kubectl oidc-login setup \
    --oidc-issuer-url=https://auth.panasasasasas.efsdfdsfsd.com/ \
    --oidc-client-id=sefrefrewrewrwerwerwer \
    --oidc-use-pkce

Flag --oidc-use-pkce has been deprecated, use --oidc-pkce-method instead. For the most providers, you don't need to set the flag.

You got the token with the following claims:

You can run the following command to set up the kubeconfig:

    kubectl config set-credentials oidc \
    --exec-api-version=client.authentication.k8s.io/v1 \
    --exec-interactive-mode=Never \
    --exec-command=kubectl \
    --exec-arg=oidc-login \
    --exec-arg=get-token \
    --exec-arg="--oidc-issuer-url=sdfdsfdsfsdfdsfdsfsdf/" \
    --exec-arg="--oidc-client-id=sefrefrewrewrwerwerwer" \
    --exec-arg="--oidc-use-pkce=true"

User "oidc" set

aparece el kubeconfig

    more ~/.kube/config

    aws eks --profile <ProfileName> --region us-east-1 update-kubeconfig --name <ClusterName>

    Aparece en el kubeconfig el arn con el clustername 


    aws eks --region us-east-1 update-kubeconfig --name <clusterName>

Mero rato pedaleando con la autneticacion

    kubectl config set-context --current --user=oidc


**Summary S3b45**

    aws sso login --profile <ProfileName>
    aws eks --profile <ProfileName> --region us-east-1 update-kubeconfig --name <ClusterName>
    kubectl config set-context --current --user=oidc



## Containers

    brew install colima
    NAKA


## privateRepos

En macOS (incluyendo la versión Sequoia), el archivo de configuración predeterminado para Bash no es ~/.bashrc, sino ~/.bash_profile.

¿Por qué no existe ~/.bash_rc en macOS?
Diferencias con Linux: En distribuciones de Linux, el archivo ~/.bashrc se usa para configurar el entorno interactivo de Bash. Sin embargo, en macOS, Bash usa ~/.bash_profile en lugar de ~/.bashrc cuando se inicia una sesión de login.


**GO libs**

## CC && FCLI

    pyenv

## docs

    docsify-cli -g

## Node

    brew install node

## pre-commit

    pre-commit clean && pre-commit autoupdate

## Anaconda|Pycharm


## GCP

    gcloud


## Python

    done

## Golang














