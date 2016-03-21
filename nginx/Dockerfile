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
  rm -rf /var/lib/apt/lists/* && \
  #echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

#docker build -t="username/nginx" .
#Usage
#docker run -d -p 80:80 username/nginx
#Attach persistent/shared directories
#docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html username/nginx
