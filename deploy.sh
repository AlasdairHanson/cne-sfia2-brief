#! /bin/bash
sudo su - jenkins
ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@34.253.192.59 << EOF

sudo rm -r cne-sfia2-brief

git clone https://github.com/AlasdairHanson/cne-sfia2-brief

export SECRET_KEY='jdfghejbfkvoi4e34'
export DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201123081921950000000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/users'
export TEST_DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201123081921950000000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/testdb'

mysql -h terraform-20201123081921950000000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com -P 3306 -u dbProject -p'dB4a15!4' < cne-sfia2-brief/database/Create.sql

mysql -h terraform-20201123081921940600000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com -P 3306 -u dbProject -p'dB4a15!4' < cne-sfia2-brief/database/Create.sql

sudo -E DATABASE_URI=$DATABASE_URI TEST_DATABASE_URI=$TEST_DATABASE_URI SECRET_KEY=$SECRET_KEY docker-compose up -d

docker exec backend bash -c "pytest tests/ --cov application" >> backend_test.txt
docker exec frontend bash -c "pytest tests/ --cov application" >> frontend_test.txt

docker tag $(sudo docker images --filter=reference=backend --format "{{.ID}}") ahanson1/backend:latest
docker push ahanson1/backend

docker tag $(sudo docker images --filter=reference=frontend --format "{{.ID}}") ahanson1/frontend:latest
docker push ahanson1/frontend

docker-compose down
exit
EOF
