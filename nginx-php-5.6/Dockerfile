FROM ubuntu:12.04
MAINTAINER bstdn <bstdn@126.com>

RUN echo "deb http://mirrors.163.com/ubuntu/ precise main restricted\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise main restricted\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-updates main restricted\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted\n" \
  "deb http://mirrors.163.com/ubuntu/ precise universe\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise universe\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-updates universe\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-updates universe\n" \
  "deb http://mirrors.163.com/ubuntu/ precise multiverse\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise multiverse\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-updates multiverse\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-security main restricted\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-security main restricted\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-security universe\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-security universe\n" \
  "deb http://mirrors.163.com/ubuntu/ precise-security multiverse\n" \
  "deb-src http://mirrors.163.com/ubuntu/ precise-security multiverse\n" \
  "deb http://extras.ubuntu.com/ubuntu precise main\n" \
  "deb-src http://extras.ubuntu.com/ubuntu precise main" > /etc/apt/sources.list
RUN apt-get update

RUN \
  apt-get install -y vim curl inetutils-ping net-tools

# Install Nginx.
RUN \
  apt-get install -y nginx && \
  chown -R www-data:www-data /var/lib/nginx && \
  usermod -u 1000 www-data

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

RUN \
  apt-get install -y python-software-properties && \
  add-apt-repository -y ppa:ondrej/php5-5.6 && \
  apt-get update

# Install Php5-fpm.
RUN \
  apt-get install -y php5-fpm php5-cgi && \
  apt-get install -y php5-mysql php5-gd php5-mcrypt && \
  apt-get install -y php5-curl php5-redis mysql-client-core-5.5 && \

RUN \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(short_open_tag\s.*\)/short_open_tag = On/' /etc/php5/fpm/php.ini

# Expose ports.
EXPOSE 80
EXPOSE 443

ADD $PWD/start.sh /start.sh

# Define default command.
CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/nginx-php-5.6" .
#docker run -d -p 80:80 --name web5.6 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html mytest/nginx-php-5.6
#docker exec -it web5.6 /bin/bash

#php-fpm 关闭：
#kill -INT `cat /var/run/php5-fpm.pid`
