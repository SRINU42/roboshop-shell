echo -e "\e[33m dowloading nodjs services  \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m installing nodejs  \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m crating a user  \e[0m"
rm -rf roboshop
useradd roboshop&>>/tmp/roboshop.log

echo -e "\e[33m crate app dir \e[0m"
rm -rf /app
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m update configuration  \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log

echo -e "\e[33m install npm \e[0m"
cd /app
npm install &>>/tmp/roboshop.log

echo -e "\e[33m update configuration  \e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service 

echo -e "\e[33m reloadong  \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[33m start catalog  \e[0m"
systemctl enable catalogue 
systemctl start catalogue &>>/tmp/roboshop.log

echo -e "\e[33m crating mongodb.repo \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33m installing mongodb \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m update schema \e[0m"
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js &>>/tmp/roboshop.log