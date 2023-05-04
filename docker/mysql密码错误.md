
# mysql8密码错误

1. 在配置文件增加  skip-grant-tables, 重启

2. 在容器内连接mysql

```
flush privileges;

SET PASSWORD FOR 'root'@'localhost' = '你的密码';
```
3. 把skip-grant-tables删掉, 重启
