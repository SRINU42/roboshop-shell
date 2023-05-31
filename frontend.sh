
echo -e "\e[33m installing nginx \e[0m"
yum install nginx -y >/tmp/roboshop.log

echo -e "\e[33m removing content in nginx \e[0m"
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log

echo -e "\e[33m loading the content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip >/tmp/roboshop.log

echo -e "\e[33m unzizng the file\e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip >/tmp/roboshop.log

echo -e "\e[33m starting nginx server \e[0m"
systempctl enable nginx >/tmp/roboshop.log
systemctl start nginx >/tmp/roboshop.log