### String,StringBuffer,StringBuilder的区别

String是数值不可改变的字符串，当一个String对象重新赋值时，会把原来的字符串对象销毁掉，然后创建一个新的字符串对象

StringBuffer,StringBuilder都是数值可以改变的字符串，

StringBuilder是线程不安全的，而StringBuffer使用synchronized保证线程安全，但是性能有所下降，

所以在非并发访问的情况下推荐使用StringBuilder