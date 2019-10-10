# DNMP (Docker + Nginx + MySQL + PHP7/5 + Redis)

- 一款全功能的**LNMP一键安装程序**

## 快速使用

1. `clone`项目

    ```
    git clone https://github.com/bstdn/dockerfile.git
    ```

2. 如果不是`root`用户，还需将当前用户加入`docker`用户组

    ```
    sudo gpasswd -a ${USER} docker
    ```

3. 拷贝并命名配置文件（Windows系统请用copy命令）

    ```
    cd dockerfile/dnmp
    cp env.sample .env
    cp docker-compose-simple.yml docker-compose.yml
    docker-compose up -d
    ```
    > 这里使用 docker-compose-simple.yml 文件，包含 Nginx、PHP7.2、PHP5.6、MySQL、Redis `5`个服务。更多服务，比如 RabbitMQ、MongoDB 等，请参考 docker-compose-full.yml 文件，把需要的拷贝到 docker-compose.yml 文件再`up`即可

4. 访问在浏览器中访问：`http://localhost`，PHP代码：`./www/localhost/index.php`文件

5. 如需管理服务，请在命令后面加上服务器名称，dnmp支持的服务名有：`nginx`、`php`、`php56`、`php54`、`mysql`、`mysql5`、`redis`、`phpmyadmin`、`phpredisadmin`、`adminmongo`、`rabbitmq`

    ```
    docker-compose up                        # 创建并且启动所有容器
    docker-compose up 服务1 服务2 ...         # 创建并且启动指定的多个容器
    docker-compose up -d 服务1 服务2 ...      # 创建并且已后台运行的方式启动多个容器

    docker-compose start 服务1 服务2 ...      # 启动服务
    docker-compose stop 服务1 服务2 ...       # 停止服务
    docker-compose restart 服务1 服务2 ...    # 重启服务
    docker-compose build 服务1 服务2 ...      # 构建或者重新构建服务

    docker-compose rm 服务1 服务2 ...         # 删除并且停止容器
    docker-compose down 服务1 服务2 ...       # 停止并删除容器，网络，图像和挂载卷
    ```

6. 添加快捷命令
在开发的时候，我们可能经常使用`docker exec -it`切换到容器中，把常用的做成命令别名是个省事的方法

打开~/.bashrc，加上：
```bash
alias dnginx='docker exec -it dnmp_nginx_1 /bin/sh'
alias dphp72='docker exec -it dnmp_php_1 /bin/bash'
alias dphp54='docker exec -it dnmp_php54_1 /bin/sh'
alias dmysql='docker exec -it dnmp_mysql_1 /bin/bash'
alias dredis='docker exec -it dnmp_redis_1 /bin/sh'
```

## PHP和扩展

### 切换Nginx使用的PHP版本

切换PHP仅需修改相应站点 Nginx 配置的`fastcgi_pass`选项，
示例的 [http://localhost](http://localhost) 用的是PHP7.2，Nginx 配置：

```
    fastcgi_pass   php:9000;
```

要改用PHP5.4，修改为：

```
    fastcgi_pass   php54:9000;
```

再 **重启 Nginx** 生效。

```
docker exec -it dnmp_nginx_1 nginx -s reload
```

### 安装PHP扩展

PHP的很多功能都是通过扩展实现，而安装扩展是一个略费时间的过程，
所以，除PHP内置扩展外，在`env.sample`文件中我们仅默认安装少量扩展，
如果要安装更多扩展，请打开你的`.env`文件修改如下的PHP配置，
增加需要的PHP扩展：

```
PHP72_EXTENSIONS=pdo_mysql,opcache,redis       # PHP 7.2要安装的扩展列表，英文逗号隔开
PHP56_EXTENSIONS=opcache,redis                 # PHP 5.6要安装的扩展列表，英文逗号隔开
```

然后重新build PHP镜像

```
docker-compose build php
docker-compose up -d
```

可用的扩展请看同文件的`PHP extensions`注释块说明

## 使用Log

Log文件生成的位置依赖于conf下各log配置的值。

### Nginx日志
Nginx日志是我们用得最多的日志，所以我们单独放在根目录`log`下。

`log`会目录映射Nginx容器的`/var/log/nginx`目录，所以在Nginx配置文件中，需要输出log的位置，我们需要配置到`/var/log/nginx`目录，如：
```
error_log  /var/log/nginx/nginx.localhost.error.log  warn;
```

### PHP-FPM日志
大部分情况下，PHP-FPM的日志都会输出到Nginx的日志中，所以不需要额外配置

另外，建议直接在PHP中打开错误日志：
```php
error_reporting(E_ALL);
ini_set('error_reporting', 'on');
ini_set('display_errors', 'on');
```

如果确实需要，可按一下步骤开启（在容器中）

1. 进入容器，创建日志文件并修改权限：
    ```bash
    $ docker exec -it dnmp_php_1 /bin/bash
    $ mkdir /var/log/php
    $ cd /var/log/php
    $ touch php-fpm.error.log
    $ chmod a+w php-fpm.error.log
    ```
2. 主机上打开并修改PHP-FPM的配置文件`conf/php-fpm.conf`，找到如下一行，删除注释，并改值为：
    ```
    php_admin_value[error_log] = /var/log/php/php-fpm.error.log
    ```
3. 重启PHP-FPM容器

### MySQL日志
因为MySQL容器中的MySQL使用的是`mysql`用户启动，它无法自行在`/var/log`下的增加日志文件。所以，我们把MySQL的日志放在与data一样的目录，即项目的`mysql`目录下，对应容器中的`/var/lib/mysql/`目录
```bash
slow-query-log-file     = /var/lib/mysql/mysql.slow.log
log-error               = /var/lib/mysql/mysql.error.log
```
以上是mysql.conf中的日志文件的配置
