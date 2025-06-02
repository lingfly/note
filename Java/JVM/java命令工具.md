# java命令工具

## jvm相关

### javap

```txt
用法: javap <options> <classes>
其中, 可能的选项包括:
  -help  --help  -?        输出此用法消息
  -version                 版本信息
  -v  -verbose             输出附加信息
  -l                       输出行号和本地变量表
  -public                  仅显示公共类和成员
  -protected               显示受保护的/公共类和成员
  -package                 显示程序包/受保护的/公共类
                           和成员 (默认)
  -p  -private             显示所有类和成员
  -c                       对代码进行反汇编
  -s                       输出内部类型签名
  -sysinfo                 显示正在处理的类的
                           系统信息 (路径, 大小, 日期, MD5 散列)
  -constants               显示最终常量
  -classpath <path>        指定查找用户类文件的位置
  -cp <path>               指定查找用户类文件的位置
  -bootclasspath <path>    覆盖引导类文件的位置

```

javap -v 是 JVM 字节码反编译的详细模式，它会输出 .class 文件的完整结构，包括常量池、方法字节码、异常表、局部变量表等详细信息.

以下是对 `public class Main { public static void main(String[] args) { int i = 1+2; } }` 使用 `javap -v` 的完整输出解析：
```java

Classfile /path/to/Main.class
  Last modified 2023-10-30; size 256 bytes   // 文件信息
  MD5 checksum xxxxxxxx
  Compiled from "Main.java"
public class Main
  minor version: 0
  major version: 52 (JDK 8)                  // 类版本（JDK 8）
  flags: ACC_PUBLIC, ACC_SUPER               // 访问标志
Constant pool:                               // 常量池（核心部分）
   #1 = Methodref          #4.#13         // java/lang/Object."<init>":()V
   #2 = Class              #14            // Main
   #3 = Class              #15            // java/lang/Object
   #4 = Utf8               <init>
   #5 = Utf8               ()V
   #6 = Utf8               Code
   #7 = Utf8               main
   #8 = Utf8               ([Ljava/lang/String;)V
   #9 = Utf8               args
  #10 = Utf8               [Ljava/lang/String;
  #11 = Utf8               i
  #12 = Utf8               I
  #13 = NameAndType        #4:#5          // "<init>":()V
  #14 = Utf8               Main
  #15 = Utf8               java/lang/Object
{
  public Main();                            // 构造方法
    descriptor: ()V
    flags: ACC_PUBLIC
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokespecial #1  // 调用Object构造方法
         4: return

  public static void main(java.lang.String[]);  // main方法
    descriptor: ([Ljava/lang/String;)V
    flags: ACC_PUBLIC, ACC_STATIC
    Code:
      stack=1, locals=2, args_size=1
         0: iconst_3           // 常量3（1+2优化结果）
         1: istore_1           // 存储到局部变量i（slot 1）
         2: return
    LocalVariableTable:        // 局部变量表
      Start  Length  Slot  Name   Signature
          0       3     0  args   [Ljava/lang/String;
          2       1     1     i   I
}
```

输出的 LocalVariableTable（局部变量表） 中，Start、Length、Slot、Name 和 Signature 分别表示以下含义：
1. Start
   * 含义：该局部变量开始生效的字节码偏移量（即从哪条指令开始可以访问这个变量）。
   * 示例：`Start: 2` 表示从字节码偏移量 2 开始（即第3条指令），该变量才被赋值并可用。
2. Length
   * 含义：该局部变量的作用范围长度（以字节码偏移量为单位）。
   * 计算方式：Start + Length = 变量失效的位置。
   * 示例：`Start: 2, Length: 5` 表示变量在偏移量 2 到 7（2+5）之间有效。
3. Slot
   * 含义：局部变量在局部变量表中的槽位索引（从 0 开始）。
   * 分配规则：
        * 非静态方法：slot 0 是 this，slot 1 开始是方法参数和局部变量。
        * 静态方法：slot 0 开始是方法参数和局部变量。
4. Name
   * 含义：局部变量的名称（源码中定义的变量名）。
   * 注意：若编译时未启用 -g 选项，名称可能显示为 arg0、arg1 等。
5. Signature
   * 含义：局部变量的类型描述符（JVM 内部表示法）。
  





