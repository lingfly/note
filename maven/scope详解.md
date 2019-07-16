scope元素用来控制dependency的作用范围

#### compile(默认)

scope的默认值是compile，意思是dependency会在编译，测试，打包，运行等阶段都起作用

#### provided

意思和compile差不多，但打包阶段会执行exclude动作

#### runtime

只在测试和运行阶段起作用

#### test

表示被依赖项目仅仅参与测试相关的工作，包括测试代码的编译，执行。

例如，Junit 测试。

#### system

含义：system 元素与 provided 元素类似，但是被依赖项不会从 maven 仓库中查找，而是从本地系统中获取，systemPath 元素用于制定本地系统中 jar 文件的路径。例如：

```xml
<dependency>
    <groupId>org.open</groupId>
    <artifactId>open-core</artifactId>
    <version>1.5</version>
    <scope>system</scope>
    <systemPath>${basedir}/WebContent/WEB-INF/lib/open-core.jar</systemPath>
</dependency>
```

#### import

它只使用在\<dependencyManagement>中，表示从其它的pom中导入dependency的配置

我们知道Maven的继承和Java的继承一样，是无法实现多重继承的，如果10个、20个甚至更多模块继承自同一个模块，那么按照我们之前的做法，这个父模块的dependencyManagement会包含大量的依赖。如果你想把这些依赖分类以更清晰的管理，那就不可能了，import scope依赖能解决这个问题。你可以把dependencyManagement放到单独的专门用来管理依赖的pom中，然后在需要使用依赖的模块中通过import scope依赖，就可以引入dependencyManagement。

