# Kubernetes cheatsheets 

**buscar loc cheatsheets viejos**


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