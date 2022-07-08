

## grep

-c: 计算找到 '搜寻字串' 的次数

-i: 忽略大小写的不同，所以大小写视为相同

-n: 输出行号

-v: 反向选择，亦即显示出没有 '搜寻字串' 内容的那一行

-l: 列出文件内容符合指定的范本样式的文件名称

-L: 列出文件内容不符合指定的范本样式的文件名称

-h: 不显示该行的文件名称

-H: 显示该行的文件名称

-q: 不显示任何信息

-o: 只输出文件中匹配到的部分

### 怎么样搜索以“-” 符号开头的匹配模式？

要使用 -e 选项来搜索匹配 '--test--' 字符串，如果不使用 -e 选项，grep 命令会试图把 '--test--' 当作自己的选项参数来解析：

```sh
grep -e '--test--' <file>
```

### 使用 grep 的“或”匹配

```sh
grep -P 'word1|word2' <file>

grep -E 'word1|word2' <file>

egrep 'word1|word2' <file>

grep 'word1\|word2' 文件名
```

## sed

### 选项与参数

-n: 使用安静（silent）模式
      
-e: 直接在命令行界面上进行 sed 的动作编辑

-f: 直接将 sed 的动作写在一个文件内， -f filename 则可以执行 filename 内的 sed 动作；

-r: sed 的动作支持的是延伸型正则表达式的语法。（默认是基础正则表达式语法）

-i: 直接修改读取的文件内容，而不是由屏幕输出。

### 动作说明

动作说明：  [n1[,n2]]function

### function

a: 新增， a 的后面可以接字串，而这些字串会在新的一行出现（目前的下一行）～

c: 取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！

d: 删除

i: 插入， i 的后面可以接字串，而这些字串会在新的一行出现（目前的上一行）；

p: 打印，亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行～

```sh
nl /etc/passwd | sed '1,2p' -n
```

s: 取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正则表达式！

```sh
1,20s/old/new/g
```

### 替换标记

/g: 替换每一行中的所有匹配

 /Ng: 从第N处匹配开始替换

 ```sh
$ echo sksksksksksk | sed 's/sk/SK/2g'
skSKSKSKSKSK
 ```


 ### e.g

 1. 删除空白行

 ```sh
 sed '/^$/d' file
 ```

 2. 删除文件的第2行到末尾所有行

 ```sh
sed '2,$d' file
 ```

 3. 引用匹配内容&

 ```sh
$ echo this is a test line | sed 's/\w\+/[&]/g'
[this] [is] [a] [test] [line]
 ```

4. 子串匹配标记\1

```sh
$ echo this is digit 7 in a number | sed 's/digit \([0-9]\)/\1/'
this is 7 in a number
```

5. 下一行：n命令

如果test被匹配，则移动到匹配行的下一行，替换这一行的aa，变为bb，并打印该行，然后继续：

```sh
sed '/test/{ n; s/aa/bb/; }' file
```
