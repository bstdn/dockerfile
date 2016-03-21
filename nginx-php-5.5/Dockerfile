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
  apt-get install -y vim curl

# Install Nginx.
RUN \
  apt-get install -y nginx && \
  chown -R www-data:www-data /var/lib/nginx

RUN \
  apt-get install -y python-software-properties && \
  add-apt-repository -y ppa:ondrej/php5 && \
  apt-get update

# Install Php5-fpm.
RUN \
  apt-get install -y php5-fpm php5-cgi && \
  apt-get install -y php5-mysql php5-gd php5-mcrypt

RUN \
  rm -rf /var/lib/apt/lists/*

ADD $PWD/start.sh /start.sh

# Expose ports.
EXPOSE 80
EXPOSE 443

CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/nginx-php-5.5" .
#docker run -d -p 80:80 --name web5.5 -v /home/vagrant/wwwroot:/home/vagrant/wwwroot username/nginx-php-5.5
#docker exec -it web /bin/bash

#docker run -d -p 80:80 --name web5.5 -v /home/vagrant/wwwroot:/home/vagrant/wwwroot --link mysql:mysql username/nginx-php-5.5

#php-fpm 关闭：
#kill -INT `cat /var/run/php-fpm/php-fpm.pid`
