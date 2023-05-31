# copy the repo 
echo -e "\e[33m  mongo repo file \e[0m"
cp mongodb.repo /etc/yum.repo.d/mongodb.repo
echo -e "\e[33m installing mongo \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

# modify the ip adderss

echo -e "\e[33m start the mogodb \e[0m"
systemctl restart mongod &>>/tmp/roboshop.log

 