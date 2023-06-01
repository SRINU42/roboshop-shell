echo -e "\e[33m dwonloading mongo repo fiel \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33m installing mongodb server \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33m update mongodb lisiten address \e[0m"
sed -i 's/127.0.0.1/0.0.0.0' /etc/mongod.conf

echo -e "\e[33m start mongodb \e[0m"
systemctl enable mongod 
systemctl restart mongod  &>>/tmp/roboshop.log


