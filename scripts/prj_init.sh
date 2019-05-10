#!/bin/bash

PROJECT_NAME="todos-ws"
EVAL_USERNAME="eval"

openstack project create \
    --description "The project contains all the components needed to create a TodosWS" \
    ${PROJECT_NAME}

openstack user create -f json --project ${PROJECT_NAME} --password "eval" ${EVAL_USERNAME}
openstack role add --project ${PROJECT_NAME} --user ${EVAL_USERNAME} member
openstack role assignment list --user ${EVAL_USERNAME} --project ${PROJECT_NAME} --names

openstack user create -f json --project todos-ws --password "password" todo
openstack role add --project todos-ws --user todo admin
openstack role assignment list --user todo --project todos-ws --names

# create floating ip (see email, need to be created as admin)
openstack floating ip create --floating-ip-address 172.24.4.28 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.21 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.6 --project todos-ws public
openstack floating ip create --floating-ip-address 172.24.4.25 --project todos-ws public




# Logging IDs in order to manually delete resources if some error occur
#CURRENT_DATE_TIME=$(date)
#printf "$CURRENT_DATE_TIME
#    PROJECT: $PROJECT
#    BASE_IMAGE: $BASE_IMAGE
#    EVAL_USER: $EVAL_USER" >> ../logs/log
