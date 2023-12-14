# ozone

s3g 提供http接口的服务，调用om容器来完成文件的读取和存储
om 整个hdfs文件系统对外的网关，有ozone风格的api接口可以调用
scm 负责把文件以block的形式存到hdfs中，存储文件前需要从这里获取存储位置(ContainerId-BlockId)
datanode 执行文件的存取，Container和Block都是datanode里的概念

这几个服务要求内网互相能通(能够互相ping通docker-compose中配置的名字)，s3g要求外网访问能通

此外，这几个服务都会调用kerberos进行权限校验，从容器内部要能够ping通 krb5 域名

可以docker inspect各个容器看一下网络配置

## s3api

```sh
# put-object
aws s3api --endpoint http://localhost:9878  put-object --bucket bucket1 --body /tmp/testfile --key test2
```
