# 

1. 更新系统和安装必要的软件包

```sh
dnf update
dnf install -y yum-utils device-mapper-persistent-data lvm2
```

2. 添加Docker的官方存储库

```sh
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
```

3. 安装docker

dnf install docker-ce

4. 错误

(尝试在命令行中添加 '--allowerasing' 来替换冲突的软件包 或 '--skip-broken' 来跳过无法安装的软件包 或 '--nobest' 来不只使用软件包的最佳候选)

5. 安装docker-compose

```sh
cp docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
chmod -x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```