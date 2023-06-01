echo -e "\e[33m conf nodejs \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log


echo -e "\e[33m install nodejs \e[0m"
yum install nodejs -y&>>/tmp/roboshop.log

echo -e "\e[33m adding roboshop user \e[0m"
rm -rf roboshop
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m create app directory \e[0m"
mkdir /app 

echo -e "\e[33m download application contents \e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/user.zip &>>/tmp/roboshop.log


echo -e "\e[33m installing nodejs dependence \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m setup systemD service \e[0m"
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service &>>/tmp/roboshop.log

echo -e "\e[33m start the user \e[0m"
systemctl daemon-reload
systemctl enable user 
systemctl start user &>>/tmp/roboshop.log

echo -e "\e[33m configuatation mongodb repo file \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/systemd/system/user.service &>>/tmp/roboshop.log

echo -e "\e[33m installing the mongodb \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m loading the schema \e[0m"
mongo --host mongodb-dev.devopssessions.store </app/schema/user.js &>>/tmp/roboshop.log
