echo -e "\e[33m install nginx \e[03"
yum install nginx -y 

echo -e "\e[33m removie content \e[03"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[33m dwonload content \e[03"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[33m unzip the content \e[03"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[33m start nginx \e[03"
#cp 
 
echo -e "\e[33m start nginx \e[03"
systemctl enable nginx 
systemctl restart nginx 