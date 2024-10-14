## 配置

1. 启动服务时修改配置文件

```conf
# my.cnf
[mysqld]
performance_schema=ON
```

2. 检查是否开启

```sql
SHOW VARIABLES LIKE 'performance_schema';
```


3. 开启instruments和consumers

```sql
UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED = 'YES';
UPDATE performance_schema.setup_consumers SET ENABLED = 'YES';
```

## 查看服务器当前正在执行的操作

1.  当前正在执行的事件:events_waits_current
2.  最近 10 个事件：events_waits_history
3.  最近 10000 个事件：events_waits_history_long