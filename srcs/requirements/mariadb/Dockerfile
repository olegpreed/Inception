FROM debian:buster

# # Set environment variables for MariaDB root user
# ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
# ENV MYSQL_DATABASE=${MYSQL_DATABASE}
# ENV MYSQL_USER=${MYSQL_USER}
# ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/*  \
# purge and re-create /var/lib/mysql with appropriate ownership
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

COPY ./tools/create_db.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/

COPY /conf/my.cnf /etc/mysql

RUN chmod a+x /usr/local/bin/create_db.sh

ENTRYPOINT ["/usr/local/bin/create_db.sh"]

#Command to launch mariadb and enable the database to listen globally

CMD ["mysqld", "--bind-address=0.0.0.0"]
