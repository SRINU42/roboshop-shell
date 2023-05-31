# copy the repo 
echo -e "\e[33m  mongo repo file \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e[33m installing mongo \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33m update monogodb listen adderss \e[0m"
sed -i -e 'S/127.0.0.1/0.0.0.0/' /etc/mongod.conf&>>/tmp/roboshop.log

echo -e "\e[33m start the mogodb \e[0m"
systemctl restart mongod &>>/tmp/roboshop.log

 