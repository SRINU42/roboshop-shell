echo -e "\e[33m conf nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m installing nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m add user roboshop \e[0m"
useradd roboshop

echo -e "\e[33m make app dir \e[0m"
mkdir /app 

echo -e "\e[33m downloading application content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip

echo -e "\e[33m install apllication content \e[0m"
npm install

echo -e "\e[33m setup conf \e[0m"
cp catalogue.service vim /etc/systemd/system/catalogue.service

echo -e "\e[33m start cofg  \e[0m"
systemctl daemon-reload

echo -e "\e[33m start the node js \e[0m"
systemctl enable catalogue 
systemctl start catalogue
 
 echo -e "\e[33m conf mongodb repo \e[0m
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e[33m install mongodb server \e[0m
yum install mongodb-org-shell -y

echo -e "\e[33m loadin schema \e[0m
mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js
