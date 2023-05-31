
echo -e "\e[33m installing nginx \e[0m"
yum install nginx -y >/tem/roboshop.log

echo -e "\e[33m removing content in nginx \e[0m"
rm -rf /usr/share/nginx/html/* >/tem/roboshop.log

echo -e "\e[33m loading the content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip >/tem/roboshop.log

echo -e "\e[33m unzizng the file\e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip >/tem/roboshop.log

echo -e "\e[33m starting nginx server \e[0m"
systemctl enable nginx >/tem/roboshop.log
systemctl start nginx >/tem/roboshop.log