
## 配置

### 查看使用的配置文件以及校验配置语法

```sh
$ nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

### 参数

####  最外层

worker_processes：提供代理服务的worker进程数

worker_rlimit_nofile：worker进程的最大打开文件数限制。如果没设置的话，这个值为操作系统的限制。设置后Nginx可以处理比“ulimit -n”更多的文件

#### Events

```nginx
events { 
    worker_connections 2048; 
    multi_accept on; 
    use epoll; 
} 
```

worker_connections：一个worker可以打开的最大连接数

multi_accept：告诉nginx收到一个新连接通知后接受尽可能多的连接。

use 设置用于复用客户端线程的轮询方法。如果你使用Linux 2.6+，你应该使用epoll。如果你使用*BSD，你应该使用kqueue。（值得注意的是如果你不知道Nginx该使用哪种轮询方法的话，它会选择一个最适合你操作系统的）

#### location

```nginx
 location / {
            proxy_pass http://test;
            proxy_set_header Host $host:$server_port;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Real-PORT $remote_port;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
```

#### ulimits

1. 查看ulimits相关配置

```sh
cat /proc/$(cat /var/run/nginx.pid)/limits
```

2. 系统ulimits

```
ulimit -a
```

3. 暂时修改

```sh
ulimit -n 2048
```

4. 永久修改

在`/etc/security/limits.conf`添加：

```sh
# 硬限制就是实际的限制，而软限制是警告限制，它只会给出警告。
* soft nofile 65535
* hard nofile 65535
```
修改后需要重启系统才能生效：`shutdown -r`


```sh
# 查看服务配置
$ systemctl status nginx

● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
```

在`/usr/lib/systemd/system/nginx.service`添加：
```
[Service]
LimitNOFILE=65535
```

重启服务：

```sh
systemctl daemon-reload

systemctl restart nginx
```

做完这些再执行`cat /proc/$(cat /var/run/nginx.pid)/limits`查看配置是否已经修改




## upstream

请求在上游服务器之间轮询，实现负载均衡

```nginx
upstream backend  {
  server backend1.example.com weight=5;
  server backend2.example.com:8080;
  server unix:/tmp/backend3;
}
 
server {
  location / {
    proxy_pass  http://backend;
  }
}
```

### ip_hash

以客户端的C类网络地址为key进行hash，同一个客户端的请求会被分发到同一台服务器，除非对应服务器崩溃了

```nginx
upstream backend {
  ip_hash;
  server   backend1.example.com;
  server   backend2.example.com;
  server   backend3.example.com  down;
  server   backend4.example.com;
}

```