#!/bin/bash

openstack keypair create --public-key keys/team_id.pub team-key

openstack server create --image xenial-server-cloudimg-amd64 --flavor ds512M \
    --security-group default --security-group todos-LoadBalancer \
    --security-group open_80 --security-group todos-ICMP \
    --security-group todos-SSH --key-name team-key --network todos-net-1 load-balancer

openstack server create --image xenial-server-cloudimg-amd64 --flavor ds512M \
    --security-group default --security-group todos-AllowLoadBalancer --security-group todos-ICMP \
    --security-group todos-SSH --security-group todos-Server --key-name team-key --network todos-net-1 server-1

openstack server create --image xenial-server-cloudimg-amd64 --flavor ds512M \
    --security-group default --security-group todos-AllowLoadBalancer --security-group todos-ICMP \
    --security-group todos-SSH --security-group todos-Server --key-name team-key --network todos-net-1 server-2

# Postgres Server is created from GUI