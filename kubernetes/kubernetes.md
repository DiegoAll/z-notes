# Kubernetes cheatsheets 

**buscar loc cheatsheets viejos**


#

## Contexts

    kubectl config

    kubectl config current-context
    kubectl config get-contexts
    kubectl config set-context <context-name> --namespace=<namespace-name> --user=<user-name> --cluster=<cluster-name>  Create new context
    kubectl config use-context <context-name> Switching Kubernetes Contexts
    kubectl config delete-context <context-name> Delete a Kubernetes Context

## Nodes

    kubectl get node  (Ver nodos)
    kubectl get no -o yaml
    kubectl get no -o wide
    kubectl describe node
    kubectl top node

## Pods

    kubectl get pod -o wide (Permite ver las IPs)
    kubectl get po --show-labels


## Namespaces





## Deployments



## Services



## DaemonSets



## Events



## Logs




## Service Accounts



## ReplicaSets


## Roles


## Secerts


## ConfigMaps


## Ingress


## Persistent Volume


## Persistent Volume Claim


## 




    kubectl exec -it  jenkins-app-2843651954-4zqdp  -- /bin/bash


**CASO ESPECIAL**

> It looks like docker exec is being used as the backend for kubectl exec. docker exec has the --user flag, which allows you to run a command as a particular user. This same functionality doesn't exist in Kubernetes.

    kubectl exec -it -u 1000 victim-vuln-pod /bin/bash
    
NO SE PUEDE EN TEORIA TOCA USAR UN PLUGIN

    https://github.com/mikelorant/kubectl-exec-user/blob/master/README.md

ACA LO ACLARAN

    https://github.com/kubernetes/kubernetes/issues/30656

O USAR UN MANIFIESTO

    https://stackoverflow.com/questions/33293265/execute-command-into-kubernetes-pod-as-other-user


    apiVersion: v1
    kind: Pod
    metadata:
    name: nginx
    labels:
        app: nginx
    spec:
    containers:
    - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        securityContext:
        runAsUser: 41