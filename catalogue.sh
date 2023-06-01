echo -e "\e[33m conf nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m installing nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m add user roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m crating app dir \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app 

echo -e "\e[33m downloading application content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log

echo -e "\e[33m install apllication content \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m setup conf \e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m start cofg  \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[33m start the node js \e[0m"
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl start catalogue &>>/tmp/roboshop.log
 
 echo -e "\e[33m conf mongodb repo \e[0m"
 cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[33m install mongodb server \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m loadin schema \e[0m" 
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js &>>/tmp/roboshop.log
