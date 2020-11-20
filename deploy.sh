#! /bin/bash
sudo su - jenkins
ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@54.78.212.171 << EOF

sudo rm -r cne-sfia2-brief

git clone https://github.com/AlasdairHanson/cne-sfia2-brief

export DATABASE_URI=mysql+pymysql://root:dB4a15!4@terraform-20201120185648967400000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/k8sdb
export TEST_DATABASE_URI=mysql+pymysql://root:dB4a15!4@terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/testdb

mysql -h terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com -P 3306 -u dbProject -p dB4a15!4 < cne-sfia2-brief/database/Create.sql

docker-compose up -d

docker exec backend bash -c "pytest tests/test_backend.py --cov application >> backend_test.txt
docker exec frontend bash -c "pytest tests/test_frontend.py --cov application >> frontend_test.txt

docker-compose down
EOF
