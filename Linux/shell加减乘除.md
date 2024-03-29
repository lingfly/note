
## let

let 命令中的等号两边不能有空格，所有的表达式需要用双引号" "包围起来。而且，所有的运算都是整数运算。

```sh
let "a = 5 + 4"
echo $a  # 输出 9

let "a = 5 - 4"
echo $a  # 输出 1

let "a = 5 * 4"
echo $a  # 输出 20

let "a = 20 / 4"
echo $a  # 输出 5

let "a = 20 % 3"
echo $a  # 输出 2



```

此外，let 命令还支持赋值、比较和条件运算

```sh
let a++
echo $a # 输出自增后的值

let a--
echo $a # 输出自减后的值

let "a = 5 == 5"  # 检查5是否等于5
echo $a  # 输出 1 ，表示 True

```

## (())

let 更多用于算术表达式的计算，例如 `let "a = 5 + 4"` ，而 ((...)) 更多用于进行条件判断，例如 `if (( a > b )); then ... fi`

```sh
a=$((5+4))
echo $a  # 输出 9

```