# 

dockerFile用于构建一个镜像

## docker build

```sh
docker build -t <image>:<tag> <context>

## -t指定镜像的标签信息
## context为dockerFile上下文，copy和add不能复制上下文以外的文件
```

## FROM

格式为 `FROM <image>`或`FROM <image>:<tag>`

第一条指令必须为 FROM 指令,引入依赖的镜像

## RUN

格式为 `RUN <command>` 或 `RUN ["executable", "param1", "param2"]`

前者将在 shell 终端中运行命令，即 `/bin/sh -c`；后者则使用 exec 执行。指定使用其它终端可以通过第二种方式实现，例如 `RUN ["/bin/bash", "-c", "echo hello"]`。

每条 RUN 指令将在当前镜像基础上执行指定命令，并提交为新的镜像。当命令较长时可以使用 `\` 来换行。

## EXPOSE

格式为 `EXPOSE <port> [<port>...]`。

告诉 Docker 服务端容器暴露的端口号，供互联系统使用。在启动容器时需要通过 -P，Docker 主机会自动分配一个端口转发到指定的端口。

## CMD

支持三种格式

* `CMD ["executable","param1","param2"]` 使用 exec 执行，推荐方式；
* `CMD command param1 param2` 在 /bin/sh 中执行，提供给需要交互的应用；
* `CMD ["param1","param2"]` 提供给 ENTRYPOINT 的默认参数

指定启动容器时执行的命令，每个 Dockerfile 只能有一条 CMD 命令。如果指定了多条命令，只有最后一条会被执行。

如果用户启动容器时候指定了运行的命令，则会覆盖掉 CMD 指定的命令。

## ENTRYPOINT