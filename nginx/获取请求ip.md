

## 配置

```
# 上下文：http, server, location
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header remote_addr $remote_addr;
```

## remote_addr和proxy_add_x_forwarded_for的区别

remote_addr是直接客户端的ip，如果经过了代理，则是代理的ip

proxy_add_x_forwarded_for记录所有经过节点的ip

比如A请求，经过B代理，再经过C代理，到达D

remote_addr是C，而proxy_add_x_forwarded_for是A,B,C