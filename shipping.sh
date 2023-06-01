echo -e "\e[33m installing moven \e[0m"
yum install maven -y &>>/tmp/roboshop.log

echo -e "\e[33m adding user \e[0m"
rm -rf roboshop
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m creating dir \e[0m" 
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m dowloading the services \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log 
cd /app 
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[33m uploading shipping jar file in maven \e[0m"
mvn clean package 
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[33m enable services \e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/yum.repos.d/shipping.service &>>/tmp/roboshop.log


echo -e "\e[33m start shipping \e[0m"
systemctl daemon-reload
systemctl enable shipping 
systemctl start shipping &>>/tmp/roboshop.log

echo -e "\e[33m installing my sql \e[0m"
yum install mysql -y  &>>/tmp/roboshop.log

mysql -h mysql-dev.devopssessions.store -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

systemctl restart shipping &>>/tmp/roboshop.log