# SSH 4 hacking

    sudo journalctl -u ssh -n 50 --no-pager

# sshuttle

cat sshd_config | grep GatewayPorts
GatewayPorts yes
at sshd_config | grep AllowTcpForwarding
AllowTcpForwarding yes
cat sshd_config | grep PermitTunnel