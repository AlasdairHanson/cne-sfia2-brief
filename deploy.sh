#! /bin/bash

ssh -i /home/ubuntu/.ssh/id_rsa jenkins@52.211.44.119 << EOF
echo hello
EOF
