#

## 配置

```sh
# 添加用户
rabbitmqctl add_user admin

# 设置标签
rabbitmqctl set_user_tags administrator

# rabbitmqctl set_permissions [--vhost <vhost>] <username> <conf> <write> <read>
rabbitmqctl set_permissions --vhost / admin ".*" ".*" ".*"

```

### tags

1. management:用户可以访问管理插件

2. policymaker:用户可以访问管理插件，并管理它们有权访问的vhost的策略和参数

3. monitoring:用户可以访问管理插件，查看所有连接和通道以及与节点相关的信息

4. administrator:用户可以执行monitoring可以执行的所有操作，管理用户、vhosts和权限，关闭其它用户的连接，以及管理所有vhosts的策略和参数。

### exchange

1. exchange：名称

2. type：类型

3. durable：是否持久化，RabbitMQ关闭后，没有持久化的Exchange将被清除

4. autoDelete：是否自动删除，如果没有与之绑定的Queue，直接删除

5. internal：是否内置的，如果为true，只能通过Exchange到Exchange

6. arguments：结构化参数

### queue

1. exclusive：是否排他，如果未true，则只在第一次创建它的Connection中有效，当Connection关闭，该Queue也会被删除
