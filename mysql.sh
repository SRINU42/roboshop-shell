echo -e "\e[33m dowloading mysql module \e[0m"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[33m enable the mysql repo \e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mssql.repo &>>/tmp/roboshop.log

echo -e "\e[33m installing my sql  \e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[33m  start mysql  \e[0m"
systemctl enable mysqld
systemctl start mysqld  &>>/tmp/roboshop.log

mysql_secure_installation --set-root-pass RoboShop@1

mysql -uroot -pRoboShop@1

