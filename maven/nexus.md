1. 下载地址：https://help.sonatype.com/repomanager3/product-information/download


## settings.xml

### 文件位置
settings.xml文件一般存在于Maven的安装目录的conf子目录下面，或者是用户目录的.m2子目录下面
### 配置项

1. LocalRepository

该值表示构建系统本地仓库的路径

```xml

<localRepository>${user.home}/.m2/repository</localRepository>
```

2. interactiveMode

当maven需要输入值时，是否由用户输入，默认为true，当为false时，maven将根据配置信息进行填充

3. offline

这个属性表示在Maven进行项目编译和部署等操作时是否允许Maven进行联网来下载所需要的信息。
如果构建系统需要在离线模式下运行，则为true，默认为false。

4. PluginGroups

在pluginGroups元素下面可以定义一系列的pluginGroup元素。表示当通过plugin的前缀来解析plugin的时候到哪里寻找。pluginGroup元素指定的是plugin的groupId。默认情况下，Maven会自动把org.apache.maven.plugins 和 org.codehaus.mojo 添加到pluginGroups下

5. proxies

 配置代理，用于多工作环境，通过proxy id即可实现环境切换

6. servers

配置访问远程服务器所需的用户信息，此处多为个人或公司私服的账号信息

7. Mirrors

用于定义一系列的远程仓库的镜像。我们可以在pom中定义一个下载工件的时候所使用的远程仓库。但是有时候这个远程仓库会比较忙，所以这个时候人们就想着给它创建镜像以缓解远程仓库的压力，也就是说会把对远程仓库的请求转换到对其镜像地址的请求。每个远程仓库都会有一个id，这样我们就可以创建自己的mirror来关联到该仓库，那么以后需要从远程仓库下载工件的时候Maven就可以从我们定义好的mirror站点来下载，这可以很好的缓解我们远程仓库的压力。在我们定义的mirror中每个远程仓库都只能有一个mirror与它关联，也就是说你不能同时配置多个mirror的mirrorOf指向同一个repositoryId。



```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.2.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 https://maven.apache.org/xsd/settings-1.2.0.xsd">
  

  <pluginGroups>
    
  </pluginGroups>

  <proxies>
    
  </proxies>

  <servers>

  </servers>

  
  <mirrors>
    <mirror>
      <id>nexus</id>
      <mirrorOf>external:*</mirrorOf>
      <url>http://localhost:8081/repository/repository-local/</url>
      <blocked>false</blocked>
    </mirror>
  </mirrors>

  <profiles>

  </profiles>

</settings>
```

## nexus批量导入

```shell
#!/bin/bash
# copy and run this script to the root of the repository directory containing files
# this script attempts to exclude uploading itself explicitly so the script name is important
# Get command line params
 
while getopts ":r:u:p:" opt; do
 case $opt in
     r) REPO_URL="$OPTARG"
     ;;
     u) USERNAME="$OPTARG"
     ;;
     p) PASSWORD="$OPTARG"
     ;;
 esac
done
 
find . -type f -not -path './mavenUpload\.sh*' -not -path '*/\.*' -not -path '*/\^archetype\-catalog\.xml*' -not -path '*/\^maven\-metadata\-local*\.xml' -not -path '*/\^maven\-metadata\-deployment*\.xml' | sed "s|^\./||" | xargs -I '{}' curl -u "$USERNAME:$PASSWORD" -X PUT -v -T {} ${REPO_URL}/{} ;
```