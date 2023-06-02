echo -e "\e[33m mogodb repofile \e[0m"
cp /home/centos/roboshop-shell/mongo.rep /etc/yum.repos.d/mongo.repo &>>/tmp/robokshop.log

echo -e "\e[33m install mongodb \e[0m"
yum install mongodb-org -y &>>/tmp/robokshop.log

echo -e "\e[33m Upadte monkgodb listen \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[33m start mongodb \e[0m"
systemctl enable mongod 
systemctl restart mongod &>>/tmp/robokshop.log