#!/bin/sh

if [ ! -f /var/www/wordpress/wp-config.php ]
then
sleep 3
cd /var/www
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown -R www:www /var/www/wordpress

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

# Replace configuration file with desired env
sed -i 's/database_name_here/'"$WP_DB"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/username_here/'"$WP_USER"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/password_here/'"$WP_PWD"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/localhost/'"$DB_HOST"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'AUTH_KEY',".*"'put your unique phrase here'"'/'"'AUTH_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'SECURE_AUTH_KEY',".*"'put your unique phrase here'"'/'"'SECURE_AUTH_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'LOGGED_IN_KEY',".*"'put your unique phrase here'"'/'"'LOGGED_IN_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'NONCE_KEY',".*"'put your unique phrase here'"'/'"'NONCE_KEY', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'AUTH_SALT',".*"'put your unique phrase here'"'/'"'AUTH_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'SECURE_AUTH_SALT',".*"'put your unique phrase here'"'/'"'SECURE_AUTH_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'LOGGED_IN_SALT',".*"'put your unique phrase here'"'/'"'LOGGED_IN_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;
sed -i 's/'"'NONCE_SALT',".*"'put your unique phrase here'"'/'"'NONCE_SALT', '""$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)""'"'/g' /var/www/wordpress/wp-config.php;

fi
wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_USER --admin_password=$WP_PWD --admin_email=$WP_EMAIL --skip-email --allow-root --path=/var/www/wordpress
wp user create $LOGIN $EMAIL --role=author --user_pass=$WP_PWD --allow-root --path=/var/www/wordpress
wp theme install inspiro --activate --allow-root --path=/var/www/wordpress

exec php-fpm7 -F