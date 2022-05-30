# Mysql-Database-Setup

# Use below commands to setup Mysql Database
    wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
    yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
    yum install mysql-community-server -y
    systemctl start mysqld.service
  # Here we get pwd
    cat /var/log/mysqld.log
  ![image](https://user-images.githubusercontent.com/58024415/104094459-07e6ef80-52b7-11eb-84b6-5263c15b4faf.png)
# Mysql Login command
    mysql -u root -p
# Change password for root user
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'Naresh#240#Kamani';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Naresh#240#Kamani' WITH GRANT OPTION;
# Create user with in mysql database
    create user 'naresh'@'localhost' IDENTIFIED BY 'Naresh#240#Kamani';
    GRANT ALL PRIVILEGES ON *.* TO 'naresh'@'%' IDENTIFIED BY 'Naresh#240#Kamani' WITH GRANT OPTION;
