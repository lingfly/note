### 279. 完全平方数

给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。

### 思路

1. DFS

    方法dfs(int x)返回组成和为x的最少个数

    递归搜索直到x==0

    坑：

    * 递归次数多，超时
    * 用记忆化搜索优化造成内存使用过多

2. BFS

    需要建一个完全平方数的表，然后在表中搜索n到0的最短路

DFS代码

```java
class Solution {
    int max;
    int[] num;
    public int numSquares(int n) {
        max=(int)Math.sqrt(n);
        num=new int[n+1];
        int result=Integer.MAX_VALUE;
        
        
        result=Math.min(result,dfs(n,0));
        
        return result;
    }
    int dfs(int x,int deep){
        int result=Integer.MAX_VALUE;
        
        if(x==0){
            return deep;
        }
        if(x<0)return Integer.MAX_VALUE;
        if(num[x]!=0)return deep+num[x];//如果已经搜索过，直接返回
        for(int i=max;i>0;i--){
            int t=dfs(x-i*i,deep+1);
            
            if(t<result){
                result=t;
            }
        }
        num[x]=result-deep;//记忆化
        return result;
    }
}
```