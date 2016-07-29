FROM blalor/centos
MAINTAINER bstdn <bstdn@126.com>

RUN \
  yum -y install gcc gcc-c++ make imake autoconf automake cmake ncurses-devel openssl openssl-devel gdbm gdbm-devel libpng libpng-devel libjpeg-6b libjpeg-devel-6b freetype freetype-devel gd gd-devel zlib zlib-devel libXpm libXpm-devel ncurses ncurses-devel libmcrypt libmcrypt-devel libxml2 libxml2-devel libtool-ltdl libtool-ltdl-devel mhash-devel openldap-devel curl-devel


RUN \
  rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm && \
  yum -y install php56w.x86_64 php56w-cli.x86_64 php56w-common.x86_64 php56w-gd.x86_64 php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pdo.x86_64 php56w-devel.x86_64 php56w-bcmath.x86_64 && \
  yum -y install php56w-fpm

RUN \
  sed -i 's/^\(short_open_tag\s.*\)/short_open_tag = On/' /etc/php.ini && \
  sed -i 's/^\(listen\s.*\)/# \1\nlisten = 0.0.0.0:9000/' /etc/php-fpm.d/www.conf && \
  sed -i 's/^\(listen\.allowed_clients\s.*\)/# \1/' /etc/php-fpm.d/www.conf

RUN \
  service php-fpm start && \
  chkconfig php-fpm on

ADD $PWD/start.sh /start.sh

# Define default command.
CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/php" .

#docker run -d --name php -v /home/vagrant/wwwroot:/home/vagrant/wwwroot username/php
