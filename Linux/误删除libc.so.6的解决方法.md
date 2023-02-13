
#

前提没有退出终端，也没有重启服务器

## 操作过程

```sh
rm -f libc.so.6

ls -lh libc*

# 删除后ls命令报错
# ls: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory

# 重新加载
LD_PRELOAD=/lib64/libc-2.12.so ln -s /lib64/libc-2.12.so /lib64/libc.so.6

```

