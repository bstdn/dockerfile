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

# Install Php5-fpm.
RUN \
  apt-get install -y php5-fpm php5-cgi && \
  apt-get install -y php5-mysql php5-gd php5-mcrypt && \
  apt-get install -y php5-curl mysql-client-core-5.5 && \
  rm -rf /var/lib/apt/lists/* && \
  usermod -u 1000 www-data && \
  sed -i 's/^\(listen\s.*\)/# \1\nlisten = 0.0.0.0:9000/' /etc/php5/fpm/pool.d/www.conf

# Define working directory.
WORKDIR /etc/php5

ADD $PWD/start.sh /start.sh

# Define default command.
CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/php" .

#docker run -d --name php -v /home/vagrant/wwwroot:/home/vagrant/wwwroot username/php

#php-fpm 关闭：
#kill -INT `cat /var/run/php5-fpm.pid`
