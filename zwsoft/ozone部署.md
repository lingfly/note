#


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