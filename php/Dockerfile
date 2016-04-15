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
  apt-get install -y vim curl inetutils-ping

# Install Php5-fpm.
RUN \
  apt-get install -y php5-fpm php5-cgi && \
  rm -rf /var/lib/apt/lists/*

# if [ -f /etc/php5/fpm/php.ini ]; then sed -i 's/^\(short_open_tag\s.*\)/short_open_tag = On/' /etc/php5/fpm/php.ini; fi

# Define working directory.
WORKDIR /etc/php5

ADD $PWD/start.sh /start.sh

# Define default command.
CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/php" .

#docker run -d --name php -v /home/vagrant/wwwroot:/home/vagrant/wwwroot username/php
