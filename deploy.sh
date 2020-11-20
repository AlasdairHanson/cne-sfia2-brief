#! /bin/bash

ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.211.44.119 << EOF
git clone https://github.com/AlasdairHanson/cne-sfia2
export DATABASE_URI=terraform-20201120093727436000000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com
export TEST_DATABASE_URI=terraform-20201120093727462000000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com
docker-compose --build
docker exec backend bash -c "pytest tests/ --cov application
docker exec frontend bash -c "pytest tests/ --cov application
docker-compose down
EOF
