### 1.equals

默认实现是比较两个对象是否引用同一对象，一般子类会重写这个方法
```java
public boolean equals(Object obj) {
    return (this == obj);
}
```

### 2.hashcode

hashcode方法返回对象的散列值，而equals是判断两个对象是否等价

等价的两个对象散列值一定相同，但是散列值相同的两个对象不一定等价

在覆盖equals方法的同时也应当覆盖hashcode方法，保证等价等价的两个对象散列值一定相同

### 3.toString

返回一个代表这个类的字符串，字符串有该类的运行时类型和散列值的十六进制形式组成

### 4.getClass

返回对象的运行时类型

### 5.wait

使当前线程进入等待状态直到其他线程唤醒

### 6.notify和notifyAll
唤醒线程

### 7.clone
创建并返回此对象的拷贝

clone()是Object的protected的方法，一个类不去显示重写clone方法，其他类就不能调用该类的clone方法

应该注意的是，clone()不是cloneable的接口方法，只是cloneable规定，一个类不实现cloneable接口又调用了clone方法，就抛CloneNotSupportedException异常

1. 浅拷贝
拷贝对象和原始对象的引用类型引用同一个对象

2. 深拷贝
为拷贝对象开辟了新的内存空间，并将原始对象的所有成员变量拷贝到新对象



