echo -e "\e[33m installing nginx \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

yum install nodejs -y

useradd roboshop

rm -rf /app
mkdir /app 

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip

cd /app 
npm install 

cp catalogue.service /etc/systemd/system/catalogue.service

systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue

cp /home/centos/roboshop-shell/mongodb.repo /etc/systemd/system/catalogue.service

yum install mongodb-org-shell -y

mongo --host mongodb-dev.devopssessions.store </app/schema/catalogue.js