# Kubernetes cheatsheets 

**buscar loc cheatsheets viejos**


#


## Cluster

    kubectl cluster-info dump
    kubectl cluster-info dump | grep 'ip-x-x-x-x.ec2.internal'

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
    kubectl describe node (*)
    kubectl top node
    kubectl explain <Object|node>

    kubectl get nodes: lista todos los nodos que tiene nuestro cluster
kubectl --config: puedes pasarle el archivo de configuración en caso de estar usando uno diferente.
kubectl --server --user: especificas la configuración sin necesidad de darle un archivo.
kubectl get nodes -a wide: muestra más datos de los nodos
kubectl describe nodes node1: da mucha información de ese nodo en especifico.
kubectl explain node: permite ver la definición de todo lo relacionado a ese nodo

## Pods

    kubectl get pods -l app=postgres

    kubectl get pod -o wide (Permite ver las IPs)
    kubectl get po --show-labels
    kubectl exec -it test -- /bin/bash


    kubectl run -i --tty --privileged --image diegoall1990/falco-workshop:0.0.1 vistima
    kubectl run -i --tty --privileged --image ubuntu:22.04 --name ubuntu-container
    kubectl run [pod_name] --image=busybox --rm -it --restart=Never --sh




    kubectl top pod --all-namespaces | sort --reverse --key 3 --numeric


    kubectl exec -it demo-falco -- sh -c "ls -al"


    kubectl port-forward zapp 8080:8080

    kubectl -c zapp -i -t (when the pod is running)  Attachear
    Session ended, resume using 'kubectl attach sneaky -c sneaky -i -t' command when the pod is running

    (Pod with 2 containers principal and secondary)
    kubectl exec -it falco-custom-pod --container=fedora-custom -- /bin/bash
    kubectl exec -it falco-custom-pod --container=fedora-custom cat /etc/os-release

    kubectl run -i --tty --image kalilinux/kali-rolling sneaky




## Namespaces





## Deployments



## Services



## DaemonSets



## Events

    kubectl get events
    kubectl get events -w




## Logs

    kubectl logs --since=1h [pod_name]
    kubectl logs --tail=20 [pod_name]




## Service Accounts



## ReplicaSets


## Roles


## Secerts


## ConfigMaps


## Ingress


## Persistent Volume


## Persistent Volume Claim


## Miscellaneous

    kubectl get componentstatus





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



## References



    https://quickref.me/kubernetes