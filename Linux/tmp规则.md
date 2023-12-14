# tmp定期清理规则



### 路径

`/usr/lib/tmpfiles.d/tmp.conf`

### 用法

```
v /tmp 1777 root root 10d
v /var/tmp 1777 root root 30d
```
1. 第一列
   
   * D 删除目录及其内容
   * d 创建目录
   * L 创建符号链接
   * f 创建常规文件
   * b 创建块设备
   * v 创建目录或文件，且只保留指定时间

2. 路径
3. 权限位（第一位是文件类型）
4. owner
5. group
6. 生存时间



