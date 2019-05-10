#!/bin/bash

openstack server remove volume db-server db-volume
openstack volume delete db-volume
openstack server delete db-server

openstack server delete server-1
openstack server delete server-2

openstack server delete load-balancer

openstack keypair delete marian-key
openstack keypair delete valentino-key

# disassociate floating ip (can run as todo)
openstack server remove floating ip db-server 172.24.4.28
openstack server remove floating ip server-1 172.24.4.6
openstack server remove floating ip server-2 172.24.4.25
openstack server remove floating ip load-balancer 172.24.4.21
