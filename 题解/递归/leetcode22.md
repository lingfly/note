### 22. 括号生成

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

例如，给出 n = 3，生成结果为：

```
[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
```

### 代码

```java
// 递归，u为左括号数，v为右括号数
// 当u==v时，只能先放左括号
class Solution {
    List<String> ans = new ArrayList<>();
    public List<String> generateParenthesis(int n) {
        func(n, n, "");
        return ans;
    }
    void func(int u, int v,String str){
        if(u==0&&v==0){
            ans.add(str);
            return;
        }
        if(u<v){
            if(u>0) func(u-1, v, str+"(");
            if(v>0) func(u, v-1, str+")");
        }
        else{
            func(u-1, v, str+"(");
        }
    }
}
```