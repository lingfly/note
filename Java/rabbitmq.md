# rabbitmq


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

#### 类型

1. 标准队列（Classic Queue）：最基础的队列类型，FIFO顺序处理消息，支持持久化、排他性等特性，适合大多数常规场景
2. 仲裁队列（Quorum Queue）：RabbitMQ 3.8+新增，基于Raft协议的高可用队列，替代镜像队列的新选择
3. Stream队列：RabbitMQ 3.9+新增，类似Apache Kafka的消息流模式，支持消息持久化和重放


#### 基础属性

1. durable: true表示队列会在RabbitMQ服务重启后依然存在，false表示队列是临时的，服务重启后会丢失。注意：durable=true只保证队列本身持久化，要保证消息也持久化，需要在发送消息时设置消息的持久化属性
2. exclusive：true表示队列是排他的，具体含义是：只能被声明它的连接使用，当连接关闭时，队列会被自动删除，其他连接无法访问此队列；false表示队列可以被多个连接共享。常用于临时队列，比如RPC场景下的回调队列
3. autoDelete: true表示当最后一个消费者断开连接后，队列会被自动删除；false表示队列会一直存在，除非手动删除，如果队列从未有过消费者，则不会自动删除

这三个属性的典型使用场景：

* 持久化消息队列：durable=true, exclusive=false, autoDelete=false
* 临时回调队列：durable=false, exclusive=true, autoDelete=true
* 共享的临时队列：durable=false, exclusive=false, autoDelete=true

#### 参数

1. x-message-ttl（消息存活时间）
   * 单位为毫秒
   * 队列中的消息如果超过这个时间还未被消费，会被自动删除
   * 可以用于实现延时队列
2. x-expires（队列存活时间）
   * 队列在多长时间未被使用后会被删除
   * 未被使用指没有消费者，也没有被重新声明
   * 通常用于临时队列的自动清理
3. x-max-length（队列最大长度）
   * 限制队列中消息的数量
   * 超过限制时可以丢弃最老的消息或拒绝新消息 
4. x-overflow（超过队列消息数量限制时的策略）
   * drop-head：默认，丢弃头部消息
   * reject-publish：拒绝新消息
5. x-dead-letter-exchange（死信交换机）
   * 消息变成死信后会被发送到这个交换机
   * 死信产生条件：
     * 消息被拒绝(reject/nack)且不重回队列
     * 消息过期
     * 队列达到最大长度
6. x-dead-letter-routing-key（死信路由键）
   * 消息被发送到死信交换机时使用的路由键
   * 如果不设置，则使用原消息的路由键
7. x-max-priority（最大优先级）
   * 启用队列的优先级功能
   * 发送消息时可以指定消息的优先级
8. x-queue-mode（队列模式）
   * lazy：惰性队列，消息尽可能多地存储在磁盘上
   * 适用于消息量大但消费速度慢的场景
9. x-queue-master-locator（主节点定位策略）
   * 在集群环境中决定队列主节点的分配策略
   * 可选值：min-masters、client-local、random等

```java
Map<String, Object> args = new HashMap<>();
args.put("x-message-ttl", 60*1000); // 60s
args.put("x-expires", 60*1000); 


```



### message

