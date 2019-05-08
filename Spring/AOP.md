### AOP术语
1. 切面(Aspect):横切关注点被模块化的对象
2. 通知(Advice):切面必须要完成的工作
3. 目标(Target):被通知的对象
4. 代理(Proxy):向目标对象应用通知之后创建的对象
5. 连接点(Joinpoint):程序执行的某个特定位置
6. 切点(Pointcut):连接点的的查询条件

### 添加jar包
+ aopalliance-1.0.jar
+ com.springsource.org.aspectj.weaver-1.6.8.RELEASE.jar
+ spring-aop-4.3.16.RELEASE.jar
+ spring-aspects-4.3.16.RELEASE.jar

### 在配置文件中加入aop命名空间
```xml
xmlns:aop="http://www.springframework.org/schema/aop"

xsi:schemaLocation="http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd "
```


### 基于注解方式
```xml
<!--为切点匹配的连接点自动生成代理对象-->
<aop:aspectj-autoproxy></aop:aspectj-autoproxy>
```

### 将横切关注点的代码抽象到切面的类中
+ @Component：声明为IOC容器中的Bean
+ @Aspect: 声明为切面

### 通知类型
1. @Before
2. @After
3. @AfterReturning
4. @AfterThrowing
5. @Around

@After无论是正常返回还是异常退出都会执行

前4种都携带JoinPoint参数，可以访问到方法的各种信息，如：方法名，方法参数

第五种是环绕类型，携带ProceedJoinPoint参数，类似于动态代理全过程，可以决定方法是否执行

### 定义优先级
@Order

### 重用表达式
@Pointcut
```java
    @Pointcut(value = "execution(* com.lingfly.aop.ArithmeticCalculatorImpl.*(*,*))")
    public void expression(){}
    @Before("expression()")
    public void verify(JoinPoint joinPoint){
        System.out.println("verify: "+ Arrays.asList(joinPoint.getArgs()));
    }
```