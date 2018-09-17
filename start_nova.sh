#!/bin/bash

export HOST_ADDRESS=`hostname -I | sed 's/^[[:space:]]*//g'`
cat /openrc.j2 | python -c 'import os;import sys; import jinja2; sys.stdout.write(jinja2.Template(sys.stdin.read()).render(env=os.environ))' > /openrc

cat /etc/nova/nova.conf.j2 | python -c 'import os;import sys; import jinja2; sys.stdout.write(jinja2.Template(sys.stdin.read()).render(env=os.environ))' > /etc/nova/nova.conf
