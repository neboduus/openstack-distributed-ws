#!/bin/bash

PROJECT_NAME="todos-ws"
EVAL_USERNAME="eval"

openstack user delete ${EVAL_USERNAME}
openstack project delete ${PROJECT_NAME}