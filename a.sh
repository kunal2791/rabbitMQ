#!bin/bash
ssh app1 "bash -c 'cat /var/lib/rabbitmq/.erlang.cookie > /tmp/test.txt bash'"
