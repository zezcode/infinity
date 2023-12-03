#!/bin/bash

wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install

read -p "Nhập link website (https://linkweb.com): " web
read -p "Nhập tên database: " dbname
read -p "Nhập tên user database: " dbuser
read -p "Nhập mật khẩu database: " dbpass
echo

mysql -u $dbuser -p$dbpass $dbname < ./sql/zero.sql

cp ./config/.config.php.o ./config/.config.php
cp ./config/settings.json.o ./config/settings.json

sed -i "s|https://localhost.com|'${web}';|" ./config/settings.json
sed -i "s|\(\$_ENV\['db_database'\] = \)'[^']*';|\1'${dbname}';|" ./config/.config.php
sed -i "s|\(\$_ENV\['db_username'\] = \)'[^']*';|\1'${dbuser}';|" ./config/.config.php
sed -i "s|\(\$_ENV\['db_password'\] = \)'[^']*';|\1'${dbpass}';|" ./config/.config.php

php xcat Tool importAllSettings

php xcat User createAdmin

domain=$(dirname "$(readlink -f "$0")")
mkdir -p $domain/storage/framework/smarty/compile/
sudo chmod -R 777 $domain/storage/framework/smarty/compile/
echo "Xây dựng máy chủ InfinityPanel thành công!"
