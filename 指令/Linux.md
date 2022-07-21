1. netstat
```shell
# 查找程序占用的端口
netstat -anp | grep (PID or program)
```

2. ps
```shell
# 查找进程信息
# e:所有进程，f:标准格式
ps -ef| grep (PID or program)

# a:包括其他用户的所有进程，u:以用户为主的格式显示，x:显示没有控制终端地进程
ps aux | grep (PID or program)

```

3. ls -Z 

显示文件SElinux相关权限

4. ps -efZ

显示进程SElinux相关权限