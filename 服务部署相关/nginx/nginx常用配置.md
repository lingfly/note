## server

### 请求body大小

```
client_max_body_size 100M;
```

### 负载均衡
```
http {
    upstream nodes {
        server 192.168.0.1;
        server 192.168.0.2;
    }
    server {
        location / {
            proxy_pass http://nodes;
        }
    }
}
```

## http

