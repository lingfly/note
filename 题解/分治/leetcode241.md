### 241. 为运算表达式设计优先级

给定一个含有数字和运算符的字符串，为表达式添加括号，改变其运算优先级以求出不同的结果。你需要给出所有可能的组合的结果。有效的运算符号包含 +, - 以及 * 。

### 思路

把+，-，*作为分隔，把表达式分为两部分计算结果

相当于在每个符号两边的表达式添加括号改变优先级

```java
class Solution {
    public List<Integer> diffWaysToCompute(String input){
        List<Integer> result=new LinkedList<>();
        
        for(int i=0;i<input.length();i++){
            char c=input.charAt(i);
            if(c=='+'||c=='-'||c=='*'){
                List<Integer> left=diffWaysToCompute(input.substring(0,i));
                List<Integer> right=diffWaysToCompute(input.substring(i+1));
                for (int l:left){
                    for (int r:right){
                        switch (c){
                            case '+':
                                result.add(l+r);
                                break;
                            case '-':
                                result.add(l-r);
                                break;
                            case '*':
                                result.add(l*r);
                                break;
                        }
                    }
                }
            }
        }
        if(result.isEmpty()){
            result.add(Integer.valueOf(input));
        }
        return result;
    }
}
```