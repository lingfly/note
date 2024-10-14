# 

## maven依赖

| 依赖                    | 原版本  | 新版本  | 备注                                                                                                     |
| ----------------------- | ------- | ------- | -------------------------------------------------------------------------------------------------------- |
| springboot              | 2.5.8   | 3.3.0   | jdk21要求springboot最低为3.1.4                                                                           |
| mysql-connector-java    | 8.0.27  | 8.3.0   | MySQL JDBC 驱动程序的坐标在springboot:2.7.8从mysql:mysql-connector-java更改为com.mysql:mysql-connector-j |
| lombok                  | 1.18.22 | 1.18.32 | jdk21要求lombok最低为1.18.30                                                                             |
| org.openjfx:javafx-base | 无      | 22      | openjdk没有javafx                                                                                        |
| jakarta.validation-api  | 2.0.2   | 3.0.2   | springboot3.0.0之后javax.validation全面切换为jakarta.validation                                          |
| jakarta.servlet-api     | 4.0.1   | 6.0.0   | springboot3.0.0之后javax.servlet全面切换为jakarta.servlet                                                |
| spring-web              | 5.3.14  | 6.1.8   | org.springframework.http.HttpMethod类的resolve替换为valueOf                                              |
| spring-security         | 5.6.1   | 6.3.0   |    SecurityConfig api变动                                                                                 |



## maven版本选择规则

传递性依赖：pom里写了依赖A，A依赖了B，则B是传递性依赖

1. 最短路径原则：深度越浅越优先
2. 声明优先原则：对于传递性的同级依赖，先声明覆盖后声明
3. 对于非传递性同级依赖，后加载覆盖先加载

## 遇到错误

### 手动指定了tomcat-embed-xxx版本9.0.59

```log
***************************
APPLICATION FAILED TO START
***************************

Description:

An attempt was made to call a method that does not exist. The attempt was made from the following location:

    org.springframework.boot.autoconfigure.web.embedded.TomcatWebServerFactoryCustomizer.customizeMaxHttpRequestHeaderSize(TomcatWebServerFactoryCustomizer.java:269)

The following method did not exist:

    'void org.apache.coyote.http11.AbstractHttp11Protocol.setMaxHttpRequestHeaderSize(int)'

The calling method's class, org.springframework.boot.autoconfigure.web.embedded.TomcatWebServerFactoryCustomizer, was loaded from the following location:

    jar:file:/C:/Users/93210/.m2/repository/org/springframework/boot/spring-boot-autoconfigure/3.3.0/spring-boot-autoconfigure-3.3.0.jar!/org/springframework/boot/autoconfigure/web/embedded/TomcatWebServerFactoryCustomizer.class

The called method's class, org.apache.coyote.http11.AbstractHttp11Protocol, is available from the following locations:

    jar:file:/C:/Users/93210/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/9.0.59/tomcat-embed-core-9.0.59.jar!/org/apache/coyote/http11/AbstractHttp11Protocol.class

The called method's class hierarchy was loaded from the following locations:

    org.apache.coyote.http11.AbstractHttp11Protocol: file:/C:/Users/93210/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/9.0.59/tomcat-embed-core-9.0.59.jar
    org.apache.coyote.AbstractProtocol: file:/C:/Users/93210/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/9.0.59/tomcat-embed-core-9.0.59.jar


Action:

Correct the classpath of your application so that it contains compatible versions of the classes org.springframework.boot.autoconfigure.web.embedded.TomcatWebServerFactoryCustomizer and org.apache.coyote.http11.AbstractHttp11Protocol

```

### proto生成的代码用到了javax.annotation.Generated

JDK21的javax没有javax.annotation.Generated

```xml
<dependency>
    <groupId>javax.annotation</groupId>
    <artifactId>javax.annotation-api</artifactId>
    <version>1.3.2</version>
</dependency>
```


###

```log
java.lang.IllegalStateException: Error processing condition on com.github.xiaoymin.knife4j.spring.configuration.Knife4jAutoConfiguration.knife4jOperationCustomizer
	at org.springframework.boot.autoconfigure.condition.SpringBootCondition.matches(SpringBootCondition.java:60)
	at org.springframework.context.annotation.ConditionEvaluator.shouldSkip(ConditionEvaluator.java:108)
	at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitionsForBeanMethod(ConfigurationClassBeanDefinitionReader.java:183)
	at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitionsForConfigurationClass(ConfigurationClassBeanDefinitionReader.java:144)
	at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitions(ConfigurationClassBeanDefinitionReader.java:120)
	at org.springframework.context.annotation.ConfigurationClassPostProcessor.processConfigBeanDefinitions(ConfigurationClassPostProcessor.java:429)
	at org.springframework.context.annotation.ConfigurationClassPostProcessor.postProcessBeanDefinitionRegistry(ConfigurationClassPostProcessor.java:290)
	at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanDefinitionRegistryPostProcessors(PostProcessorRegistrationDelegate.java:349)
	at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanFactoryPostProcessors(PostProcessorRegistrationDelegate.java:118)
	at org.springframework.context.support.AbstractApplicationContext.invokeBeanFactoryPostProcessors(AbstractApplicationContext.java:788)
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:606)
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:146)
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754)
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:456)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:335)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1363)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1352)
	at com.zwsoft.WkCollApplication.main(WkCollApplication.java:17)
Caused by: java.lang.IllegalStateException: Failed to introspect Class [com.github.xiaoymin.knife4j.spring.configuration.Knife4jAutoConfiguration] from ClassLoader [jdk.internal.loader.ClassLoaders$AppClassLoader@36baf30c]
	at org.springframework.util.ReflectionUtils.getDeclaredMethods(ReflectionUtils.java:483)
	at org.springframework.util.ReflectionUtils.doWithMethods(ReflectionUtils.java:360)
	at org.springframework.util.ReflectionUtils.getUniqueDeclaredMethods(ReflectionUtils.java:417)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.lambda$getTypeForFactoryMethod$1(AbstractAutowireCapableBeanFactory.java:750)
	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1708)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.getTypeForFactoryMethod(AbstractAutowireCapableBeanFactory.java:749)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.determineTargetType(AbstractAutowireCapableBeanFactory.java:682)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.predictBeanType(AbstractAutowireCapableBeanFactory.java:653)
	at org.springframework.beans.factory.support.AbstractBeanFactory.isFactoryBean(AbstractBeanFactory.java:1687)
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doGetBeanNamesForType(DefaultListableBeanFactory.java:562)
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanNamesForType(DefaultListableBeanFactory.java:534)
	at org.springframework.boot.autoconfigure.condition.OnBeanCondition.collectBeanNamesForType(OnBeanCondition.java:247)
	at org.springframework.boot.autoconfigure.condition.OnBeanCondition.getBeanNamesForType(OnBeanCondition.java:240)
	at org.springframework.boot.autoconfigure.condition.OnBeanCondition.getBeanNamesForType(OnBeanCondition.java:230)
	at org.springframework.boot.autoconfigure.condition.OnBeanCondition.getMatchingBeans(OnBeanCondition.java:183)
	at org.springframework.boot.autoconfigure.condition.OnBeanCondition.getMatchOutcome(OnBeanCondition.java:158)
	at org.springframework.boot.autoconfigure.condition.SpringBootCondition.matches(SpringBootCondition.java:47)
	... 17 common frames omitted
Caused by: java.lang.NoClassDefFoundError: javax/servlet/Filter
	at java.base/java.lang.ClassLoader.defineClass1(Native Method)
	at java.base/java.lang.ClassLoader.defineClass(ClassLoader.java:1027)
	at java.base/java.security.SecureClassLoader.defineClass(SecureClassLoader.java:150)
	at java.base/jdk.internal.loader.BuiltinClassLoader.defineClass(BuiltinClassLoader.java:862)
	at java.base/jdk.internal.loader.BuiltinClassLoader.findClassOnClassPathOrNull(BuiltinClassLoader.java:760)
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClassOrNull(BuiltinClassLoader.java:681)
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:639)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:188)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:526)
	at java.base/java.lang.Class.getDeclaredMethods0(Native Method)
	at java.base/java.lang.Class.privateGetDeclaredMethods(Class.java:3578)
	at java.base/java.lang.Class.getDeclaredMethods(Class.java:2676)
	at org.springframework.util.ReflectionUtils.getDeclaredMethods(ReflectionUtils.java:465)
	... 33 common frames omitted
Caused by: java.lang.ClassNotFoundException: javax.servlet.Filter
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:641)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:188)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:526)
	... 46 common frames omitted
```

```xml
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>4.0.1</version>
      <scope>provided</scope>
    </dependency>
```


### 

```log
***************************
APPLICATION FAILED TO START
***************************

Description:

The dependencies of some of the beans in the application context form a cycle:

┌──->──┐
|  expImpTaskExecutor
└──<-──┘


Action:

Relying upon circular references is discouraged and they are prohibited by default. Update your application to remove the dependency cycle between beans. As a last resort, it may be possible to break the cycle automatically by setting spring.main.allow-circular-references to true.
```

```properties
spring.main.allow-circular-references=true
```


### 

```log
Caused by: java.lang.NoClassDefFoundError: org/apache/hc/client5/http/classic/HttpClient
	at com.zwsoft.wk_common_web.util.BackendFileStorage.onInit(BackendFileStorage.java:71)
	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
	at java.base/java.lang.reflect.Method.invoke(Method.java:580)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor$LifecycleMethod.invoke(InitDestroyAnnotationBeanPostProcessor.java:457)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor$LifecycleMetadata.invokeInitMethods(InitDestroyAnnotationBeanPostProcessor.java:401)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor.postProcessBeforeInitialization(InitDestroyAnnotationBeanPostProcessor.java:219)
	... 48 common frames omitted
Caused by: java.lang.ClassNotFoundException: org.apache.hc.client5.http.classic.HttpClient
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:641)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:188)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:526)
	... 54 common frames omitted
```

```xml
    <dependency>
      <groupId>org.apache.httpcomponents.client5</groupId>
      <artifactId>httpclient5</artifactId>
      <version>5.3.1</version>
    </dependency>
```


###

```log
Parameter 1 of method knife4jOpenApiCustomizer in com.github.xiaoymin.knife4j.spring.configuration.Knife4jAutoConfiguration required a bean of type 'org.springdoc.core.SpringDocConfigProperties' that could not be found.
```