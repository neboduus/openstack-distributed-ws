#!/bin/bash

PROJECT_NAME="todos-ws"
EVAL_USERNAME="eval"

openstack project create \
    --description "The project contains all the components needed to create a TodosWS" \
    ${PROJECT_NAME}

openstack user create -f json --project ${PROJECT_NAME} --password "eval" ${EVAL_USERNAME}
openstack role add --project ${PROJECT_NAME} --user ${EVAL_USERNAME} admin
openstack role assignment list --user ${EVAL_USERNAME} --project ${PROJECT_NAME} --names

openstack user create -f json --project todos-ws --password "password" todo
openstack role add --project todos-ws --user todo admin
openstack role assignment list --user todo --project todos-ws --names

openstack volume create --size 5 --type lvmdriver-1 \
    --description "Stores data for both server-1 and server-2" \
    --project todos-ws db-volume


# Logging IDs in order to manually delete resources if some error occur
#CURRENT_DATE_TIME=$(date)
#printf "$CURRENT_DATE_TIME
#    PROJECT: $PROJECT
#    BASE_IMAGE: $BASE_IMAGE
#    EVAL_USER: $EVAL_USER" >> ../logs/log
