# official docker-compose 使用说明

## 执行命令

```
# 创建php-5.6镜像
docker build -t official/php-5.6 /path/to/official/php-5.6/
```

## 创建站点配置文件(可选)

```
在 /path/to/official/nginx/conf.d/ 目录中，创建自己的站点配置文件
```


## 如有需要，自定义配置文件(可选)

```
cp /path/to/official/mysql/mysql.conf.bak /path/to/official/mysql/mysql.conf
cp /path/to/official/nginx/nginx.conf.bak /path/to/official/nginx/nginx.conf
cp /path/to/official/php-5.6/php.ini.bak /path/to/official/php-5.6/php.ini
```

## 复制文件

```
cp /path/to/official/docker-compose.yml.bak /path/to/official/docker-compose.yml
```

## 执行命令

```
docker-compose up -d
```
