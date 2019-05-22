### 997. 找到小镇的法官
在一个小镇里，按从 1 到 N 标记了 N 个人。传言称，这些人中有一个是小镇上的秘密法官。

如果小镇的法官真的存在，那么：

小镇的法官不相信任何人。
每个人（除了小镇法官外）都信任小镇的法官。
只有一个人同时满足属性 1 和属性 2 。
给定数组 trust，该数组由信任对 trust[i] = [a, b] 组成，表示标记为 a 的人信任标记为 b 的人。

如果小镇存在秘密法官并且可以确定他的身份，请返回该法官的标记。否则，返回 -1。

### 思路
如果存在法官，那么这个人满足：
1. 入度为N-1(除去自己)
2. 出度为0

用judge数组维护出度，0表示出度为0，1表示出度不为0
degree保存入度

```java
class Solution {
    public int findJudge(int N, int[][] trust) {
        int[] judge=new int[N+1];
        int[] degree=new int[N+1];
        
        for(int i=0;i<trust.length;i++){
            int a=trust[i][0];
            int b=trust[i][1];
            judge[a]=1;
            degree[b]++;
        }
        int flag=-1;
        for(int i=1;i<=N;i++){
            if(judge[i]==0&&degree[i]==N-1){
                flag=i;
            }
        }
        return flag;
    }
}
```