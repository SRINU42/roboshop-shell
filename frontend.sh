echo -e "\e[33m install nginx \e[0m" 
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[33m removie content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[33m dwonload content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m unzip the content \e[0m"
cd /usr/share/nginx/html &>>/tmp/roboshop.log 
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m start nginx \e[0m"
cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log
 
echo -e "\e[33m start nginx \e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log