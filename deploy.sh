#! /bin/bash

ssh -tt -i /home/jenkins/.ssh/id_rsa jenkins@ip-10-0-0-41 << EOF
echo hello
EOF
