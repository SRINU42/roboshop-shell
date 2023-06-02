echo -e "\e[33m installing nginx \e[0m"
yum install nginx -y 

echo -e "\e[33m remove content nginx \e[0m"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[33m dowloading the content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[33m unzip the content \e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip 

echo -e "\e[33m fetching the conf \e[0m"
cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf 

echo -e "\e[33m start nginx \e[0m"
systemctl enable nginx
systemctl restart nginx  

