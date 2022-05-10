### 配置

在pom文件中添加依赖
```xml
<dependency>
    <groupId>com.github.pagehelper</groupId>
    <artifactId>pagehelper-spring-boot-starter</artifactId>
    <version>1.2.10</version>
</dependency>
```

### 使用

在调用mybatis查询前调用如下方法，就可实现分页功能

1. 方法可以有一个Page类型的返回值，封装了有关分页的各种数据
2. 也可以用PageInfo包装查询返回的结果对象，PageInfo记录了更详细的分页信息
```java
PageHelper.startPage(pageNum,PageSize);
```

### 原理
未完待续