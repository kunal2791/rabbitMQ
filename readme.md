###############################################################################
#Script to automate the setup of RabbitMQ and to enable HA using ansible.
#HA for all the
###############################################################################
the script is divided into 4 parts.
#############
main.yaml is the main file which is use to call all 3 modules.

#############
install.yaml is the file where i've defined all packeges and dependencies of rabbitmq to be installed. and the script we are using for multipurpoes we also use it to upgrade old versions of rabbitmq to version 3.7 and erlang 20.

#############
config.yaml i'm using here to get erlang cookie and to export the same to all rabbit nodes, as its required for RabbitMQ clustering. the same file is also responsible for joining of cluster and to convert node to disc and ram node.

##############
ha.yaml is for configuring HA mode in rabbitMQ queues.

