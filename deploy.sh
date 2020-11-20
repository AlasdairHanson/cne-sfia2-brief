#! /bin/bash

ssh -oStrictHostKeyChecking=no jenkins@52.211.44.119 << EOF
echo hello
EOF
