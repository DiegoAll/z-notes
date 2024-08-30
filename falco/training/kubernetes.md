# Kubernetes


Kubernetes Security using Falco
As Kubernetes grows in adoption, it is crucial to know how to secure it.

In a dynamic infrastructure platform such as Kubernetes, detecting and addressing threats is challenging.

Falco is one of the leading open-source Kubernetes threat detection engines.



There are four main steps to install and run Falco on the host successfully:

Install kernel headers
Add Falco chart repository
Install the chart
Test Falco
A note on upgrading a helm chart
To install Falco on Kubernetes, use the Helm chart; ensure you are running the latest version of Helm.



apt search linux-headers-$(uname -r)

apt-get -y install linux-headers-$(uname -r)

apt search linux-headers-$(uname -r)


helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update



kubectl create ns falco
helm install falco \
    -n falco \
    --version 4.0.0 \
    --set tty=true \
    --set collectors.containerd.enabled=true \
    --set collectors.containerd.socket=/run/k3s/containerd/containerd.sock \
falcosecurity/falco


kubectl wait pods --for=condition=Ready -l app.kubernetes.io/name=falco -n falco --timeout=150s



kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco


kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep "find /root -name id_rsa"