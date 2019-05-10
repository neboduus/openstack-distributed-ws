#!/bin/bash

# NET 1
openstack network create --project todos-ws todos-net-1

openstack subnet create --project todos-ws --subnet-range 10.20.31.0/24 \
    --network todos-net-1 --gateway 10.20.31.1 todos-subnet-1

openstack router create --project todos-ws todos-router-1
openstack router set todos-router-1 --external-gateway public
openstack router add subnet todos-router-1 todos-subnet-1

# NET 2
openstack network create --project todos-ws todos-net-2

openstack subnet create --project todos-ws --subnet-range 10.20.32.0/24 \
    --network todos-net-2 --gateway 10.20.32.1 todos-subnet-2

openstack router add subnet todos-router-1 todos-subnet-2

# Security Groups
openstack security group create --project todos-ws open_80
openstack security group rule create --project todos-ws --dst-port 80 --protocol tcp --remote-ip 0.0.0.0/0 open_80

openstack security group create --project todos-ws todos-ICMP
openstack security group rule create --project todos-ws --protocol icmp --remote-ip 0.0.0.0/0 todos-ICMP

openstack security group create --project todos-ws todos-SSH
openstack security group rule create --project todos-ws --dst-port 22 --protocol tcp --remote-ip 0.0.0.0/0 todos-SSH

openstack security group create --project todos-ws todos-LoadBalancer

openstack security group create --project todos-ws todos-AllowLoadBalancer
openstack security group rule create --project todos-ws --dst-port 3000 --protocol tcp \
  --remote-group todos-LoadBalancer todos-AllowLoadBalancer

openstack security group create --project todos-ws todos-Server

openstack security group create --project todos-ws todos-AllowServer
openstack security group rule create --project todos-ws --dst-port 5432 --protocol tcp \
  --remote-group todos-Server todos-AllowServer
