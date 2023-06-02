echo -e "\e[33m install nginx \e[0m"
yum install nginx -y &>>/tmp/robokshop.log

echo -e "\e[33m removing content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/robokshop.log

echo -e "\e[33m dowloading content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/robokshop.log

echo -e "\e[33m unzip content \e[0m"
cd /usr/share/nginx/html &>>/tmp/robokshop.log
unzip /tmp/frontend.zip &>>/tmp/robokshop.log

echo -e "\e[33m conf services \e[0m"
cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/robokshop.log

echo -e "\e[33m starting \e[0m"
systemctl enable nginx &>>/tmp/robokshop.log
systemctl restart nginx &>>/tmp/robokshop.log