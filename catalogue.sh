echo -e "\e[33m dowloading nodejs services \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m installing the nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m adding user and dir \e[0m"
useradd roboshop &>>/tmp/roboshop.log
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m dowloading catalogue configuration  \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[33m unzip the catalogue content \e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[33m installing npm \e[0m"
npm install &>>/tmp/roboshop.log

cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log
echo -e "\e[33m start the catalogue \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

echo -e "\e[33m configuring mongodb repo \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[33m installing mongodb \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m loading the schema\e[0m"
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js &>>/tmp/roboshop.log

