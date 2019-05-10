#!/bin/bash

openstack volume create --size 5 --type lvmdriver-1 \
    --description "Stores data for both server-1 and server-2" \
    --project todos-ws db-volume

openstack keypair create --public-key keyteam/marian_key.pub marian-key
openstack keypair create --public-key keyteam/valentino.key.pub valentino-key

openstack server create --image ubuntu-xenial --flavor ds512M \
    --security-group 2a954174-f21d-4ade-a925-65fcc950145a --security-group todos-LoadBalancer \
    --security-group open_80 --security-group todos-ICMP \
    --security-group todos-SSH --key-name marian-key --network todos-net-1 load-balancer

openstack server create --image ubuntu-xenial --flavor ds512M \
    --security-group 2a954174-f21d-4ade-a925-65fcc950145a --security-group todos-AllowLoadBalancer --security-group todos-ICMP \
    --security-group todos-SSH --security-group todos-Server --key-name marian-key --network todos-net-2 server-1

openstack server create --image ubuntu-xenial --flavor ds512M \
    --security-group 2a954174-f21d-4ade-a925-65fcc950145a --security-group todos-AllowLoadBalancer --security-group todos-ICMP \
    --security-group todos-SSH --security-group todos-Server --key-name marian-key --network todos-net-2 server-2

openstack server create --image ubuntu-xenial --flavor ds512M \
    --security-group 2a954174-f21d-4ade-a925-65fcc950145a --security-group todos-AllowServer --security-group todos-ICMP \
    --security-group todos-SSH --key-name marian-key --network todos-net-2 db-server

# associate floating ip (can run as todo)
openstack server add floating ip db-server 172.24.4.28
openstack server add floating ip server-1 172.24.4.6
openstack server add floating ip server-2 172.24.4.25
openstack server add floating ip load-balancer 172.24.4.21

openstack server add volume --device /dev/vdb db-server db-volume
