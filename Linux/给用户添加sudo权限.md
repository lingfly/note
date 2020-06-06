# 给用户添加sudo权限

通过编辑/etc/sudoers文件来添加权限，但是这个文件不能直接编辑

使用visudo命令编辑/etc/sudoers文件，添加
```shell
# 设置sudo权限
username ALL=(ALL:ALL) ALL

# 设置sudo权限且不需要输入密码
username ALL=(ALL:ALL) NOPASSWORD:ALL

```
username -用户名

ALL –在所有主机上(如果将同一sudoers文件分发到多台计算机)

(ALL) –作为任何目标用户

ALL –可以运行任何命令

在visudo编辑中，Ctrl+O保存，Ctrl+X退出