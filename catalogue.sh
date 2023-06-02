echo -e "\e[33m configuring nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/robokshop.log


echo -e "\e[33m install nodjs \e[0m"
yum install nodejs -y &>>/tmp/robokshop.log

echo -e "\e[33m create user \e[0m"
rm -rf roboshop
useradd roboshop
rm -rf /app
mkdir /app &>>/tmp/robokshop.log 

echo -e "\e[33m add aplication content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 

echo -e "\e[33m unzip the content \e[0m"
unzip /tmp/catalogue.zip &>>/tmp/robokshop.log
cd /app 

echo -e "\e[33m install npm \e[0m"
npm install &>>/tmp/robokshop.log

echo -e "\e[33m setup conf service \e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/robokshop.log

echo -e "\e[33m start catalogue \e[0m"
systemctl daemon-reload &>>/tmp/robokshop.log
systemctl enable catalogue 
systemctl restart catalogue &>>/tmp/robokshop.log

echo -e "\e[33m mongodb repofile  \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/robokshop.log

echo -e "\e[33m installing mongodb \e[0m"
yum install mongodb-org-shell -y &>>/tmp/robokshop.log

echo -e "\e[33m loading the schema \e[0m"
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js &>>/tmp/robokshop.log