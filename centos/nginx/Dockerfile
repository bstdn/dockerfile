FROM blalor/centos
MAINTAINER bstdn <bstdn@126.com>

RUN echo "# nginx.repo" > /etc/yum.repos.d/nginx.repo && \
  echo "[nginx]" >> /etc/yum.repos.d/nginx.repo && \
  echo "name=nginx repo" >> /etc/yum.repos.d/nginx.repo && \
  echo "baseurl=http://nginx.org/packages/centos/6/\$basearch/" >> /etc/yum.repos.d/nginx.repo && \
  echo "gpgcheck=0" >> /etc/yum.repos.d/nginx.repo && \
  echo "enabled=1" >> /etc/yum.repos.d/nginx.repo && \
  yum install -y nginx && \
  service nginx start && \
  chkconfig nginx on && \
  rm -f /etc/yum.repos.d/nginx.repo

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443

ADD $PWD/start.sh /start.sh

# Define default command.
CMD ["/bin/bash", "/start.sh"]

#docker build -t="username/nginx" .
#Usage
#docker run -d -p 80:80 username/nginx
#Attach persistent/shared directories
#docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html username/nginx
