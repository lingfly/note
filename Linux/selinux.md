# SELinux

Security Enhanced Linux 

## 基本概念

1. 主体(Subject): SELinux主要管理的对象，等同于进程

2. 目标(Object): 主体能否读取的目标资源，文件、目录、端口、设备等，主要是文件和目录

3. 策略(Policy): 制定默认的规则对某些服务进行管制

4. 规则(Rule): 决定某个主体是否能访问某个目标资源

### 三个主要的策略

1. targeted: 针对网络服务

2. minimum: 仅针对选择的程序来保护

3. mls: 完整的SELinux限制

## 启动模式

1. 查询当前模式: `getenforc`

2. 三种模式

    * enforce: 强制模式，对不匹配的资源禁止访问
    * permissive: 宽容模式，只给警告不会禁止访问
    * disabled: 关闭，未开启SELinux管控

3. 修改模式: `setenforce [0 | 1]`

    * 0: permissive
    * 1: enforce

4. 配置文件: `/etc/selinux/config`

    可以修改策略和模式，如果由 enforcing 或 permissive 改成 disabled ，或由 disabled 改成其他两个需要重启系统


## 安全上下文

1. 查看文件安全上下文：`ls -Z`

2. 查看主体进程上下文：`ps -Z`

```sh
[[email protected] ~]# ls -Z
-rw-------. root root system_u:object_r:admin_home_t:s0     anaconda-ks.cfg
-rw-r--r--. root root system_u:object_r:admin_home_t:s0     initial-setup-ks.cfg
-rw-r--r--. root root unconfined_u:object_r:admin_home_t:s0 regular_express.txt
```

安全上下文主要用冒号分为三个字段，这三个字段的意义为：

```
Identify:role:type
身份识别:角色:类型
```
在默认的 targeted 政策中，主要根据type来判断权限

## 规则

1. 查询规则是否开启 `getsebool [-a | boolean]`

2. 启用关闭规则 `setsebool -P bool=[0 | 1]`

    -P: 把修改写入配置文件

3. 查询规则具体控制哪些目标 `sesearch -A`
    
    * -s: 指定主体
    * -t: 指定目标
    * -b: 指定规则bool

4. 查询身份、角色、类型、规则 `seinfo`

## 修改安全上下文

1. 恢复默认上下文: `restorecon -Rv`

    * -r/R: 递归处理目录
    * 打印处理信息

2. 默认上下文增删查改 `semanage fcontext `
    
    * -l: 查询
    * -a: 增加
    * -m: 修改
    * -d: 删除

## 查看audit日志

路径：/var/log/audit/audit.log

1. audit2why

`audit2why < /var/log/audit/audit.log`

2. audit2allow

`audit2allow < /var/log/audit/audit.log`