
1. 导包，4.7以上
```xml
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.7</version>
    <scope>test</scope>
</dependency>
```
2. Rule注解

```java
@Rule
public final ExpectedException expectedException=ExpectedException.none();
```
3. 设置期望的异常

```java
expectedException.expect(ClassCastException.class);
```