#!/bin/bash

openstack security group delete todos-AllowLoadBalancer
openstack security group delete todos-LoadBalancer

openstack security group delete todos-AllowServer
openstack security group delete todos-Server

openstack security group delete todos-SSH
openstack security group delete todos-ICMP

openstack router remove subnet todos-router-1 todos-subnet-1
openstack router unset --external-gateway todos-router-1
openstack router delete todos-router-1

openstack subnet delete todos-subnet-1
openstack network delete todos-net-1
