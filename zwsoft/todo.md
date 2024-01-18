
0108 18.00-21.00
0109 18.00-20.30



## todo


MK-13651 bim项目管理


### 导入导出

 drvinfo表 oid不一致
 ro rule 重复绑定失败

## obsolete

MK-12537 mongo加载方案

jdbc:mysql://rm-wz94s8x8wyj9qjpc8.mysql.rds.aliyuncs.com:3306/wk_lps?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC

## done

MK-12553 保存不稳定bug
MK-12733 邮件反馈
MK-10651 ro策略校验
MK-14324、MK-14295 保存并发异常

## cicd流程加上prod环境的测试




## 为什么后端不能生成处理树结构


0 21 * * * <command> && (crontab -l | sed '/<command>/d' | crontab -)


```sh
curl -d 'apiUser=***&apiKey=***&from=test@test.com&fromName=liubida&subject=测试&replyTo=reply@test.com&templateInvokeName=ifaxin_bill' --data-urlencode 'xsmtpapi={"to": ["ben@ifaxin.com", "joe@ifaxin.com"],"sub":{"%name%": ["Ben", "Joe"],"%money%":[288, 497]}}&headers={"header1": "value1", "header2": "value2"}' http://api2.sendcloud.net/api/mail/sendtemplate
```



```sh
SHELL=/usr/bin/bash
PATH=/usr/bin
MAILTO=root
12 20 * * * root /home/aliyun/update_version.sh 
```