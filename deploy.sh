#! /bin/bash
sudo su - jenkins
ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@54.78.212.171 << EOF

sudo rm -r cne-sfia2-brief

git clone https://github.com/AlasdairHanson/cne-sfia2-brief

export DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/users'
export TEST_DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/testdb'

#DATABASE
mysql -h terraform-20201120185648967400000003.clh36ghk8zgg.eu-west-1.rds.amazonaws.com -P 3306 -u dbProject -p'dB4a15!4' < cne-sfia2-brief/database/Create.sql
#TEST DATABASE
mysql -h terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com -P 3306 -u dbProject -p'dB4a15!4' < cne-sfia2-brief/database/Create.sql

sudo -E DATABASE_URI=$DATABASE_URI TEST_DATABASE_URI=$TEST_DATABASE_URI docker-compose up -d

docker exec backend bash -c "pytest tests/ --cov application" >> backend_test.txt
docker exec frontend bash -c "pytest tests/ --cov application" >> frontend_test.txt

docker-compose down
exit
EOF
