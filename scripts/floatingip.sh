# create floating ip (see email, need to be created as admin)
openstack floating ip create --floating-ip-address 172.24.4.28 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.21 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.6 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.25 --project todos-ws public


# delete  floating ip  (can run as toddo)
openstack floating ip delete 172.24.4.28
openstack floating ip delete 172.24.4.21
openstack floating ip delete 172.24.4.6
openstack floating ip delete 172.24.4.25


#------------------------------------------------------


# associate floating ip (can run as todo)
openstack server add floating ip db-server 172.24.4.28
openstack server add floating ip server-1 172.24.4.6
openstack server add floating ip server-2 172.24.4.25
openstack server add floating ip load-balancer 172.24.4.21


# disassociate floating ip (can run as todo)
openstack server remove floating ip db-server 172.24.4.28
openstack server remove floating ip server-1 172.24.4.6
openstack server remove floating ip server-2 172.24.4.25
openstack server remove floating ip load-balancer 172.24.4.21
