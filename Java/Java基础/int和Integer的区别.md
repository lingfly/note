### int和Integer的区别

int是基本类型，Integer是int的包装类

Java5引入了自动装箱/拆箱机制，使得二者可以相互转换

```java
    Integer a = new Integer(3);
    Integer b = 3;                  // 将3自动装箱成Integer类型
    int c = 3;
    System.out.println(a == b);     // false 两个引用没有引用同一对象
    System.out.println(a == c);     // true a自动拆箱成int类型再和c比较
```