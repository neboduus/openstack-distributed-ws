# openstack-distributed-ws

## App Scenario
The application is basically the classical To-Do List that allows anonymous users to
create, store and retrieve lists of items from a remote database

## App Basic Components
The application is composed of the following main components:
* Load Balancer - NGINX application used to balance traffic ​for optimizing resource
utilization, maximizing throughput, reducing latency, and ensuring fault-tolerant
configurations.
* Business Logic Server - Ruby on Rails REST API that applies business logic on
data
* Database Server ​ - PostgreSQL server that acts as a remote RDBMS

## How to install
In order to install al the stff you need first of all OpenStack installed. This is a difficult task, in fact we have used 3-rd parties Openstack services.
Once you have Openstack, you can use all the scripts inside the project. In /scripts there are the scripts for generating the infrastructure and in /app you have the Docker files for deploying the applications mentioned above.


