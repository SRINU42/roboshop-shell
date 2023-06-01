echo -e "\e[33m conf golang \e[0m"
yum install golang -y &>>/tmp/roboshop.log

echo -e "\e[33m add user \e[0m"
rm -rf roboshop
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m creating app directory \e[0m"
mkdir /app 
echo -e "\e[33m dowloading the dispatch  \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/dispatch.zip &>>/tmp/roboshop.log

echo -e "\e[33m initiating dispatch \e[0m"
go mod init dispatch
go get 
go build &>>/tmp/roboshop.log

echo -e "\e[33m enabling service \e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/yum.repos.d/dispatch.service &>>/tmp/roboshop.log

echo -e "\e[33m start dispach \e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl start dispatch  &>>/tmp/roboshop.log

