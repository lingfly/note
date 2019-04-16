### Java Queue用法
#### 实现类LikedList
LikedList类实现了Deque接口，而Deque接口继承于Queue接口

没有实现阻塞接口，也就是说不支持put和take方法（这两个方法执行不成功时阻塞）

1. 添加元素

add(E):返回布尔值

offer(E):返回布尔值

实际上，offer就是调用add方法


2. 不删除返回队首元素

element():队列为空时抛出NoSuchElementException异常
```java
public E element() {
    return getFirst();
}
public E getFirst() {
    final Node<E> f = first;
    if (f == null)
        throw new NoSuchElementException();
    return f.item;
}
```

peek():队列为空时返回null

```java
public E peek() {
    final Node<E> f = first;
    return (f == null) ? null : f.item;
}
```

3. 移除并返回队首元素

remove():队列为空时抛出NoSuchElementException异常
```java
public E remove() {
    return removeFirst();
}
public E removeFirst() {
    final Node<E> f = first;
    if (f == null)
        throw new NoSuchElementException();
    return unlinkFirst(f);
}
```
poll():队列为空时返回null

```java
public E poll() {
    final Node<E> f = first;
    return (f == null) ? null : unlinkFirst(f);
}
```
