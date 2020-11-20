#! /bin/bash

ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.211.44.119 << EOF
echo hello
exit
EOF
