echo -e "\e[33m dowloading the python \e[0m"
yum install python36 gcc python3-devel -y &>>/tmp/roboshop.log

echo -e "\e[33m add user \e[0m"
rm -rf roboshop
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m creating dir \e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m dowloagin the conf \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip &>>/tmp/roboshop.log
cd /app 
unzip /tmp/payment.zip &>>/tmp/roboshop.log

echo -e "\e[33m installing pip3.6 \e[0m" 
cd /app 
pip3.6 install -r requirements.txt &>>/tmp/roboshop.log

echo -e "\e[33m conf payment service \e[0m"
cp /home/centos/roboshop-shell/payment.service /etc/yum.repos.d/payment.service &>>/tmp/roboshop.log

echo -e "\e[33m start payment \e[0m"
systemctl daemon-reload
systemctl enable payment 
systemctl start payment &>>/tmp/roboshop.log
