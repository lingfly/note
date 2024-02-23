#

s3g 提供http接口的服务，调用om容器来完成文件的读取和存储
om 整个hdfs文件系统对外的网关，有ozone风格的api接口可以调用
scm 负责把文件以block的形式存到hdfs中，存储文件前需要从这里获取存储位置(ContainerId-BlockId)
datanode 执行文件的存取，Container和Block都是datanode里的概念

这几个服务要求内网互相能通(能够互相ping通docker-compose中配置的名字)，s3g要求外网访问能通

此外，这几个服务都会调用kerberos进行权限校验，从容器内部要能够ping通 krb5 域名

可以docker inspect各个容器看一下网络配置

##

```sh
# 卸载
python3 poz.py uninstall -C /root/.poz.ini -Y

# 安装
python3 poz.py auto-install 
```

安装成功后打印的日志
```sh
> You should manually create buckets [upload-files],[cicd-1] before use the ozone oss.

> Step 1: docker exec -it c1_s3g_1 sh
> Step 2: aws configure
          AWS Access Key ID [None]: awss3/s3g@KRB5
          AWS Secret Access Key [None]: ba93e1553fa62b640214b0cffdd8d55db68bfcd5b6987c19858cc3c327b5443c
> Step 3: aws s3api --endpoint http://127.0.0.1:9878 create-bucket --bucket=upload-files
> Step 4: aws s3api --endpoint http://127.0.0.1:9878 create-bucket --bucket=cicd-1

> Next Step: insert s3 store into database, update policy stores, clear cache.

> [MySQL sample]
INSERT INTO wk_dev.store (`oid`,`name`,`type`,`flags`,`description`,`fcs_url`,`path`,`host`,`port`,`prem`,`protocol`,`ftp_user`,`ftp_pass`,`tenant_id`) VALUES (414264747262023,"s3",3,0,"ozone oss","","upload-files","192.168.17.160",9878,1,"http","awss3/s3g@KRB5","ba93e1553fa62b640214b0cffdd8d55db68bfcd5b6987c19858cc3c327b5443c",1);
UPDATE wk_dev.policy SET `store`=414264747262023;

> [PostgreSQL sample]
INSERT INTO "wk_dev"."store" ("oid","name","type","flags","description","fcs_url","path","host","port","prem","protocol","ftp_user","ftp_pass","tenant_id") VALUES (414264747262023,"s3",3,0,"ozone oss","","upload-files","192.168.17.160",9878,1,"http","awss3/s3g@KRB5","ba93e1553fa62b640214b0cffdd8d55db68bfcd5b6987c19858cc3c327b5443c",1);
UPDATE "wk_dev"."policy" SET "store"=414264747262023;

> [Clear Redis cache]

-- OZONE SUCCESSFULLY INSTALLED ON THE MACHINE!
```

## s3api

```sh
# put-object
aws s3api --endpoint http://localhost:9878  put-object --bucket bucket1 --body /tmp/testfile --key test2
```
