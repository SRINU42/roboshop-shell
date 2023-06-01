echo -e "\e[33m conf nodejs \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log


echo -e "\e[33m install nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m adding roboshop user \e[0m"
rm -rf roboshop
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m create app directory \e[0m"
mkdir /app 

eecho -e "\e[33m download application contents \e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/cart.zip &>>/tmp/roboshop.log


echo -e "\e[33m installing nodejs dependence \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m setup systemD service \e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "\e[33m start the user \e[0m"
systemctl daemon-reload
systemctl enable cart 
systemctl start cart &>>/tmp/roboshop.log

