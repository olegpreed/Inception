FROM alpine:3.18

RUN apk update && \
	apk add php8 php8-fpm php8-mysqli mariadb-client curl

# Copy www.conf (Listen to port 9000) to container
COPY conf/www.conf /etc/php8/php-fpm.d/default.conf

# # add downloads and extracts archive 
# ADD https://wordpress.org/wordpress-6.3.2.tar.gz /var/www/
# # RUN cd /var/www && tar -xzvf wordpress-6.3.2.tar.gz
# RUN rm -f /var/www/wordpress-6.3.2.tar.gz

# I need to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# check to make sure that the file is working, using another command:
 && php wp-cli.phar --info \ 
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
COPY	/tools/start.sh /
RUN		chmod 777 /start.sh
CMD		/start.sh