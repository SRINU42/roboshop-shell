echo -e "\e[33m install packages rabbitmq \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[33m installing packages rabbitmq service \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "\e[33m install rabbitmq \e[0m"
yum install rabbitmq-server -y &>>/tmp/roboshop.log

echo -e "\e[33m start rabbitmq \e[0m"
systemctl enable rabbitmq-server 
systemctl start rabbitmq-server &>>/tmp/roboshop.log

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" 
