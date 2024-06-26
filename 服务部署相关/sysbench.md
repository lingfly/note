

## fileio

| ip     | thead-num | file-test-mode   | file-num | file-total-size | file-block-size | read, MiB/s | written, MiB/s |
| ------ | --------- | ---------------- | -------- | --------------- | --------------- | ----------- | -------------- |
| 17.198 | 1         | rndrw (随机读写) | 2        | 1G              | 1024            | 6.79        | 4.52           |
| 17.198 | 1         | rndrw (随机读写) | 20       | 1G              | 1024            | 1.51        | 1.01           |
| 17.198 | 1         | rndrw (随机读写) | 200      | 1G              | 1024            | 0.46        | 0.31           |
| 17.207 | 1         | rndrw (随机读写) | 2        | 1G              | 1024            | 7.60        | 5.06           |
| 17.207 | 1         | rndrw (随机读写) | 20       | 1G              | 1024            | 1.70        | 1.13           |
| 17.207 | 1         | rndrw (随机读写) | 20       | 1G              | 1024            | 0.49        | 0.33           |
| 0.10   | 1         | rndrw (随机读写) | 2        | 1G              | 1024            | 11.36       | 7.57           |
| 0.10   | 1         | rndrw (随机读写) | 20       | 1G              | 1024            | 3.67        | 2.45           |
| 0.10   | 1         | rndrw (随机读写) | 200      | 1G              | 1024            | 1.75        | 1.17           |

```sh
sysbench --test=fileio --file-num=2 --file-block-size=1024 --file-total-size=1G prepare
sysbench --test=fileio --file-num=2 --file-block-size=1024 --file-total-size=1G --file_test_mode=rndrw --time=30 run
```

## 数据库测试

| ip     | thread num | test-mode   | write(写入次数) | transactions(插入总行数) | total time | per sec.  |
| ------ | ---------- | ----------- | --------------- | ------------------------ | ---------- | --------- |
| 17.198 | 1          | bulk_insert | 44              | 1375842                  | 10.2200s   | 134612.04 |
| 17.207 | 1          | bulk_insert | 62              | 1900092                  | 10.0239s   | 189541.53 |
| 0.10   | 1          | bulk_insert | 72              | 2191342                  | 10.0472s   | 218084.77 |

### 内置脚本目录

/usr/share/sysbench/

### 常用参数

```sh
–-table_size=N	每个表的行数	[10000]
–-tables=N	表的个数	[1]
```

### 建库，建用户
```sql
CREATE DATABASE `test_db` CHARACTER SET 'utf8mb4';

CREATE USER `test`@`%` IDENTIFIED WITH mysql_native_password BY 'test1234' PASSWORD EXPIRE NEVER;

GRANT Create, Delete, Drop, Insert, Select, Trigger, Update ON `test_db`.* TO `test`@`%`;
```


### 批量插入测试

```sh
sysbench --db-driver=mysql --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test --mysql-password=test1234 --mysql-db=test_db  bulk_insert prepare

sysbench --db-driver=mysql --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test --mysql-password=test1234 --mysql-db=test_db  bulk_insert run

sysbench --db-driver=mysql --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test --mysql-password=test1234 --mysql-db=test_db  bulk_insert cleanup
```

## 内存测试

| ip     | memory-oper | memory-block-size | memory-total-size | MiB/sec  |
| ------ | ----------- | ----------------- | ----------------- | -------- |
| 17.198 | write       | 1K                | 100G              | 10651.09 |
| 17.198 | read        | 1K                | 100G              | 12863.65 |
| 17.207 | write       | 1K                | 100G              | 10663.21 |
| 17.207 | read        | 1K                | 100G              | 12865.63 |
| 0.10   | write       | 1K                | 100G              | 8786.26  |
| 0.10   | read        | 1K                | 100G              | 10887.39 |

```sh
sysbench memory --time=30  run
sysbench memory --time=30 --memory-oper=read run
```


