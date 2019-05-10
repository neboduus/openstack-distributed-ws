#!/bin/bash

openstack keypair delete team-key
openstack volume delete db-volume

openstack user delete eval
openstack user delete todo

# delete  floating ip  (can run as toddo)
openstack floating ip delete 172.24.4.28
openstack floating ip delete 172.24.4.21
openstack floating ip delete 172.24.4.6
openstack floating ip delete 172.24.4.25
