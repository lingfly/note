# 集群

## docker stack


1. 部署 stack

```sh
docker stack deploy --compose-file docker-compose.yml myStack
```

2. 列出所有的 stacks：

```sh
docker stack ls
```

3. 获取一个 stack 的详细信息：
```sh
docker stack ps myStack
```

4. 删除一个 stack：

```sh
docker stack rm myStack
```

## Docker Service

1. 创建服务
```sh
docker service create [OPTIONS] IMAGE [COMMAND] [ARG...]
```

2. 列出所有的服务

```sh
docker service ls
```

3. 查看服的详细信息

```sh
docker service inspect [OPTIONS] SERVICE
```

4. 查看服务中的任务

```sh
docker service ps [OPTIONS] SERVICE
```

5. 缩放服务

```sh
docker service scale SERVICE=REPLICAS [SERVICE=REPLICAS...] 
```

6. 更新一个或多个服务

```sh
docker service update [OPTIONS] SERVICE
```

7. 滚动更新服务

```sh
docker service update --force [OPTIONS] SERVICE
```

## network

1. 查询一个特定网络上正在运行的 Docker 服务

```sh
docker network inspect <network_name>
```

2. 创建network

```sh
docker network create -d overlay --subnet=192.168.0.0/16 my-overlay
```

## 节点标签

1. 添加或更新节点标签

```sh
docker node update --label-add type=frontend node1
```

2. 查看节点标签

```sh
docker node inspect node1 --pretty
```

3. 删除节点标签

```sh
docker node update --label-rm type node1
```

