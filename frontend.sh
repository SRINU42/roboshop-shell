echo -e "\e[31m this is red colour \e[0m"
yum install nginx -y &>>tmp/roboshop.log

echo -e "\e[31m this is red colour \e[0m"
rm -rf /usr/share/nginx/html/* &>>tmp/roboshop.log

echo -e "\e[31m this is red colour \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>tmp/roboshop.log

echo -e "\e[31m this is red colour \e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>tmp/roboshop.log

echo -e "\e[31m this is red colour \e[0m"
cp /home/centos/roboshop-shell/frontend.service /etc/nginx/default.d/roboshop.conf &>>tmp/roboshop.log

echo -e "\e[31m this is red colour \e[0m"
systemctl enable nginx 
systemctl start nginx 
systemctl restart nginx &>>tmp/roboshop.log


