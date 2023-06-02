echo -e "\e[33m installing nginx \e[0m"
yum install nginx -y &>>/tmp/robokshop.log

echo -e "\e[33m remove content nginx \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/robokshop.log

echo -e "\e[33m dowloading the content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/robokshop.log

echo -e "\e[33m unzip the content \e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>/tmp/robokshop.log

echo -e "\e[33m fetching the conf \e[0m"
cp /home/centos/roboshop-shell/ &>>/tmp/robokshop.log

echo -e "\e[33m start nginx \e[0m"
systemctl enable nginx 
systemctl restart nginx  &>>/tmp/robokshop.log

