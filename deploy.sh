#! /bin/bash
ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.211.44.119 << EOF

sudo rm -r cne-sfia2-brief

git clone https://github.com/AlasdairHanson/cne-sfia2-brief

export DATABASE_URI=mysql+pymysql://root:dB4a15!4@terraform-20201120093727462000000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/k8sdb

export TEST_DATABASE_URI=mysql+pymysql://root:dB4a15!4@terraform-20201120093727436000000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/testdb

docker-compose -e DATABASE_URI={DATABASE_URI}, TEST_DATABASE_URI={TEST_DATABASE_URI} --build

docker exec backend bash -c "pytest tests/ --cov application >> backend_test.txt
docker exec frontend bash -c "pytest tests/ --cov application >> frontend_test.txt

docker-compose down
EOF
