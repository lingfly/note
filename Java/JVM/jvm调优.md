
#

## 查看jvm默认配置

### -XX:+PrintCommandLineFlags

```sh
java -XX:+PrintCommandLineFlags -version
```

```log
-XX:InitialHeapSize=520931968 -XX:MaxHeapSize=8334911488 -XX:+PrintCommandLineFlags -XX:+UseCompressedClassPointers -XX:+UseCompressedOops -XX:+UseParallelGC 
java version "1.8.0_202"
Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
```

### -XX:PrintGCDetails 

```sh
java -XX:+PrintGCDetails -version
```

```
java version "1.8.0_202"
Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
Heap
 PSYoungGen      total 148992K, used 5120K [0x000000071a600000, 0x0000000724c00000, 0x00000007c0000000)
  eden space 128000K, 4% used [0x000000071a600000,0x000000071ab00188,0x0000000722300000)
  from space 20992K, 0% used [0x0000000723780000,0x0000000723780000,0x0000000724c00000)
  to   space 20992K, 0% used [0x0000000722300000,0x0000000722300000,0x0000000723780000)
 ParOldGen       total 339968K, used 0K [0x00000005cf200000, 0x00000005e3e00000, 0x000000071a600000)
  object space 339968K, 0% used [0x00000005cf200000,0x00000005cf200000,0x00000005e3e00000)
 Metaspace       used 2204K, capacity 4480K, committed 4480K, reserved 1056768K
  class space    used 241K, capacity 384K, committed 384K, reserved 1048576K
```

### jcmd <pid> VM.flags

```
-XX:CICompilerCount=12 -XX:InitialHeapSize=6442450944 -XX:MaxHeapSize=6442450944 -XX:MaxNewSize=2147483648 -XX:MinHeapDeltaBytes=524288 -XX:NewSize=2147483648 -XX:OldSize=4294967296 -XX:+UseCompressedClassPointers -XX:+UseCompressedOops -XX:+UseFastUnorderedTimeStamps -XX:+UseParallelGC
```

### -XX:+PrintFlagsFinal

### jinfo -flag MaxNewSize <pid>

## jdk8的jvm参数

# JDK 8 JVM参数列表

### 堆内存相关

1. `-Xms`: 设置堆的初始大小
   例：`-Xms512m`

2. `-Xmx`: 设置堆的最大大小
   例：`-Xmx2g`

3. `-XX:NewSize`: 设置年轻代的初始大小
   例：`-XX:NewSize=256m`

4. `-XX:MaxNewSize`: 设置年轻代的最大大小
   例：`-XX:MaxNewSize=512m`

5. `-XX:SurvivorRatio`: 设置Eden区与Survivor区的比例
   例：`-XX:SurvivorRatio=8`

6. `-XX:NewRatio`: 设置年轻代与老年代的比例
   例：`-XX:NewRatio=2`

### 垃圾回收相关

7. `-XX:+UseParallelGC`: 使用并行收集器
8. `-XX:+UseG1GC`: 使用G1垃圾收集器
9. `-XX:+UseConcMarkSweepGC`: 使用CMS垃圾收集器
10. `-XX:ParallelGCThreads`: 设置并行收集器的线程数
    例：`-XX:ParallelGCThreads=4`

11. `-XX:MaxGCPauseMillis`: 设置最大GC停顿时间
    例：`-XX:MaxGCPauseMillis=200`

12. `-XX:InitiatingHeapOccupancyPercent`: 设置触发标记周期的Java堆占用率阈值
    例：`-XX:InitiatingHeapOccupancyPercent=45`

### 性能调优

13. `-XX:+AggressiveOpts`: 启用积极优化
14. `-XX:+UseLargePages`: 使用大页内存
15. `-XX:LargePageSizeInBytes`: 设置大页内存的大小
    例：`-XX:LargePageSizeInBytes=2m`

### 调试和监控

16. `-XX:+HeapDumpOnOutOfMemoryError`: 在发生OutOfMemoryError时自动生成堆转储
17. `-XX:HeapDumpPath`: 指定堆转储文件的保存路径
    例：`-XX:HeapDumpPath=/tmp/heapdump.hprof`

18. `-XX:+PrintGCDetails`: 打印详细的GC日志
19. `-XX:+PrintGCDateStamps`: 打印GC的日期时间戳
20. `-Xloggc`: 指定GC日志文件的位置
    例：`-Xloggc:/var/log/gc.log`

### 其他重要参数

21. `-XX:MetaspaceSize`: 设置Metaspace的初始大小
    例：`-XX:MetaspaceSize=128m`

22. `-XX:MaxMetaspaceSize`: 设置Metaspace的最大大小
    例：`-XX:MaxMetaspaceSize=256m`

23. `-XX:+UseStringDeduplication`: 开启字符串去重（G1收集器特性）
24. `-XX:+UseCompressedOops`: 使用压缩指针
25. `-XX:ThreadStackSize`: 设置线程栈大小
    例：`-XX:ThreadStackSize=256k`

注意：这些参数应根据具体应用和系统环境进行调整。过度调优可能会适得其反，建议在充分测试的基础上逐步优化。

### 默认值

