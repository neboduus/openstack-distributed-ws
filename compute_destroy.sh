#!/bin/bash

openstack keypair delete team-key
openstack server delete load-balancer
openstack server delete server-1
openstack server delete server-2