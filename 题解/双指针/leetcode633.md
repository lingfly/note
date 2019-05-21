### 633. 平方数之和
题目描述：给定一个非负整数c，判断是否存在两个数a,b使a^2+b^2=c

题解：

使a=0，b的上界必是sqrt(c)，逐一判断即可

```java
class Solution {
    public boolean judgeSquareSum(int c) {
        int i=0,j=(int)Math.sqrt(c);
        while(true){
            int sum=i*i+j*j;
            if(sum==c)return true;
            if(i==j)return false;
            if(sum>c)j--;
            else if(sum<c)i++;
        }
    }
}
```