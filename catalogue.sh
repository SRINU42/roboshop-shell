echo -e "\e[33m conf nodejs \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log


echo -e "\e[33m install nodejs \e[0m"
yum install nodejs -y&>>/tmp/roboshop.log

echo -e "\e[33m create user roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m create app dir \e[0m"
rm -rf /app
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m download application contents \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip

echo -e "\e[33m installing nodejs dependence \e[0m"
npm install 

echo -e "\e[33m setup systemD service \e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m starting the nodejs \e[0m"
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue &>>/tmp/roboshop.log

echo -e "\e[33m configuatation mongodb repo file \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[33m installing the mongodb \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m loading the schema \e[0m"
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js &>>/tmp/roboshop.log