# loki使用文档

## 日志流选择器

格式：`{标签="标签值"}`，标签可以写多个，用逗号`,`分隔。例如`{instance="192.168.50.196",service="wk_plm"}`

其中标签后面的 `=` 操作符是标签匹配操作符，LogQL一共支持以下四种标签匹配操作符：

1. `=`：完全匹配

2. `!=`：不相等

3. `=~`：正则匹配

4. `!~`：正则不匹配



目前配置的标签只有三种：

1. filename：值是具体的文件绝对路径

2. service：值是wk_admin、wk_file、wk_login、wk_model、wk_plm、wk_resource、wk_search中的一个

3. instance：值是节点ip，目前只有192.168.50.196

## 日志管道



