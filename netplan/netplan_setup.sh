#!/bin/bash
# @Author: Po-Ting Ko
# @Date: 2023-07-05
# @Last Modified: 2023-07-05 by Ko
# @Description:

FILE_PATH="/etc/netplan/01-network-manager-all.yaml"
if [ ! -f "$FILE_PATH" ]; then
    echo "check the configure file is exist or not"
    exit 1
fi

if [ $# -eq 0 ]; then 
    INTERFACE="eth0"
else
    INTERFACE="$1"
fi

IP_ADDRESS="192.168.0.5"
SUBNET_MASK="24"
GATEWAY="192.168.0.1"

## setup netplan for specific ethernet interface
cat > $FILE_PATH << EOF
network:
  version: 2
  renderer: NetworkManager
    ethernets:
      $INTERFACE:
        dhcp4: false
        addresses: [$IP_ADDRESS/$SUBNET_MASK]
        routes:
          - to: default
            via: $GATEWAY 

EOF

netplan try
if [ $? -eq 0 ]; then
    netplan apply
fi
