


    docker build --no-cache -t diegoall1990/falco-workshop:0.0.1 .


    docker run -d -it --net host --pid host --userns host --privileged --cap-add=ALL --name broken-cgroup1 ubuntu:22.04 sleep 36000
