#!/bin/sh

if [ ! -d /var/www/wordpress ]
then
mkdir -p /var/www
cd /var/www
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown -R www:www /var/www
mv /root/conf/wp-config.php /var/www/wordpress
fi

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

# Replace configuration file with desired env
sed -i 's/database_name_here/'"$DB_NAME"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/username_here/'"$DB_USER"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/password_here/'"$DB_PASSWORD"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/localhost/'"$DB_HOST"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'AUTH_KEY',".*"'put your unique phrase here'"'/'"'AUTH_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'SECURE_AUTH_KEY',".*"'put your unique phrase here'"'/'"'SECURE_AUTH_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'LOGGED_IN_KEY',".*"'put your unique phrase here'"'/'"'LOGGED_IN_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'NONCE_KEY',".*"'put your unique phrase here'"'/'"'NONCE_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'AUTH_SALT',".*"'put your unique phrase here'"'/'"'AUTH_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'SECURE_AUTH_SALT',".*"'put your unique phrase here'"'/'"'SECURE_AUTH_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'LOGGED_IN_SALT',".*"'put your unique phrase here'"'/'"'LOGGED_IN_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'NONCE_SALT',".*"'put your unique phrase here'"'/'"'NONCE_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;

exec php-fpm7 -F