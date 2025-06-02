# maven

## 依赖规则

1. 直接依赖优先
2. 先声明优先
3. 路径最近优先

## dependency

### optional

A -> B -> C(optional)，如果A没有直接引用C，则C不在A的依赖之中，

如下引入lombok时，optional为true，当别的模块引入我的模块时不会引入lombok，如果要用则要单独引入
```xml
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <optional>true</optional>
</dependency>
```

### score

| 取值     | 作用范围     | 依赖传递 | 举例        |
| -------- | ------------ | -------- | ----------- |
| compile  | all          | yes      | spring-core |
| provided | compile,test | no       | servlet-api |
| runtime  | runtime,test | yes      | jdbc驱动    |
| test     | test         | no       | junit       |
| system   | compile,test | yes      |             |


system和provided的区别是system必须手动指定依赖文件的路径，如：
```xml
<dependency>
    <groupId>javax.sql</groupId>
    <artifactId>jdbc-stdext</artifactId>
    <version>2.0</version>
    <scope>system</scope>
    <systemPath>${java.home}/lib/rt.jar</systemPath>
</dependency>
```

#### <scope>import</scope>

表示将该 POM 类型的依赖 导入当前项目的 <dependencyManagement> 中。
这只能在 <dependencyManagement> 块中使用，作用是把目标 BOM 中定义的依赖版本信息引入到当前项目中。

### type

#### <type>pom</type>

表示这个依赖的 打包类型是 POM。
也就是说，这个依赖并不是一个 jar 包，而是一个 POM 类型的项目，一般用于集中管理依赖版本。



