###############################################################################
#Script to automate the setup of RabbitMQ and to enable HA using ansible.
#HA for all the
###############################################################################

The script is divided into 4 parts.
#############

main.yaml is the main file which we use to call all 3 modules.

#############

Install.yaml is the file where I've defined all packages and dependencies of rabbitmq to be installed. Here we are using the script to upgrade old versions of rabbitmq to version 3.7 and erlang 20.

#############

config.yaml I'm using here to get erlang cookie and to export the same to all rabbit nodes, as it's required for RabbitMQ clustering. the same file is also responsible for joining of the cluster and to convert node to disc and ram node.

##############

ha.yaml is for configuring HA mode in rabbitMQ queues.


