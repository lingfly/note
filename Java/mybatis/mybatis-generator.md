### 配置
配置文件中必须指定以下5个属性：

1. jdbcConnection：数据库连接
2. javaModelGenerator：javaBean的生成路径
3. sqlMapGenerator：sql的mapper文件生成路径
4. javaClientGenerator：DAO接口生成路径
5. table：对象和关系的映射规则

配置文件
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>
    <!--classPathEntry:jdbc驱动的路径，可选-->
    <!--<classPathEntry location="/Program Files/IBM/SQLLIB/java/db2java.zip" />-->

    <!--id必需，上下文唯一标识-->
    <!--targetRuntime：指定代码生成的运行时目标，
    支持的值：
        1.MyBatis3Simple：只生产简单的crud，不包括含条件的crud
        2.MyBatis3：可生成包含条件的crud
        3.MyBatis3DynamicSql：移除了XXXExamle类和xml文件,不兼容其他的TargetRuntime-->
    <context id="MySQLTables" targetRuntime="MyBatis3">
        <!--jdbcConnection：指定数据库连接-->
        <jdbcConnection driverClass="com.mysql.cj.jdbc.Driver"
                        connectionURL="jdbc:mysql://101.132.191.34/cache"
                        userId="root"
                        password="a12345">
        </jdbcConnection>
        <!--javaTypeResolver：java类型解析器，可选-->
        <javaTypeResolver >
            <property name="forceBigDecimals" value="false" />
        </javaTypeResolver>

        <!--targetPackage：指定model(表对应的实体类)的包路径；targetProject：项目路径-->
        <javaModelGenerator targetPackage="lingfly.mbg.entity" targetProject="./src/main/java/">
            <property name="enableSubPackages" value="true" />
            <property name="trimStrings" value="true" />
        </javaModelGenerator>

        <!--sqlMapGenerator：生成mapper文件-->
        <sqlMapGenerator targetPackage="resources/mapper"  targetProject="./src/main">
            <property name="enableSubPackages" value="true" />
        </sqlMapGenerator>

        <!--javaClientGenerator：生成接口
            XMLMAPPER：接口依赖于mapper的xml文件-->
        <javaClientGenerator type="XMLMAPPER" targetPackage="lingfly.mbg.dao"  targetProject="./src/main/java/">
            <property name="enableSubPackages" value="true" />
        </javaClientGenerator>
        <!--table：指定要分析的表，必须设置
        默认会把下划线转换为驼峰命名法-->
        <table schema="cache" tableName="department" domainObjectName="Department" ></table>
        <table tableName="employee" domainObjectName="Employee" ></table>
    </context>
</generatorConfiguration>

```
### 运行

使用maven插件运行
```xml
<plugin>
    <groupId>org.mybatis.generator</groupId>
    <artifactId>mybatis-generator-maven-plugin</artifactId>
    <executions>
        <execution>
            <id>Generate MyBatis Artifacts</id>
            <phase>deploy</phase>
            <goals>
                <goal>generate</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <!-- generator 工具配置文件的位置 -->
        <configurationFile>src/main/resources/mybatis-generator.xml</configurationFile>
        <verbose>true</verbose>
        <overwrite>true</overwrite>
    </configuration>
    <dependencies>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.15</version>
        </dependency>
        <!--MyBatis Generator-->
        <dependency>
            <groupId>org.mybatis.generator</groupId>
            <artifactId>mybatis-generator-core</artifactId>
            <version>1.3.5</version>
        </dependency>
    </dependencies>
    <version>1.3.5</version>
</plugin>
```

