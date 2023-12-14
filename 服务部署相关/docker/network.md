# Docker网络模式

在使用docker run创建Docker容器时，可以用 --net 选项指定容器的网络模式，Docker可以有以下4种网络模式：

host模式：使用 --net=host 指定。

none模式：使用 --net=none 指定。

bridge模式：使用 --net=bridge 指定，默认设置。

container模式：使用 --net=container:NAME_or_ID 指定。

## 

```sh
# 查看已有的网络
docker network ls
```