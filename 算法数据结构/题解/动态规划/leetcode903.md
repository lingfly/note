### 903. DI 序列的有效排列

我们给出 S，一个源于 {'D', 'I'} 的长度为 n 的字符串 。（这些字母代表 “减少” 和 “增加”。）
有效排列 是对整数 {0, 1, ..., n} 的一个排列 P[0], P[1], ..., P[n]，使得对所有的 i：

如果 S[i] == 'D'，那么 P[i] > P[i+1]，以及；
如果 S[i] == 'I'，那么 P[i] < P[i+1]。
有多少个有效排列？因为答案可能很大，所以请返回你的答案模 10^9 + 7.


### 思路

首先，在已知S[i]的情况下，P[i+1]取决于S[i]和P[i]以及未选择的元素中小于P[i]的元素个数

定义dp[i][j]表示已选i+1的元素的情况下，剩余j个比P[i]小的元素的排列个数

比如说，S="DID"

i=0，选第一个元素的时候，不受S影响
```java
dp[0][3] = 1  (3)
dp[0][2] = 1  (2)
dp[0][1] = 1  (1)
dp[0][0] = 1  (0)
```

i=1,S[i]='D',降序

当是降序时，意味着要取一个比P[i-1]小的元素，所以dp[i][j]的值只能由dp[i-1][k],k>=j+1来决定。
且剩余的比P[i]小的元素不可能大于等于n-i,
所以j的范围是0 <= j <= n-i
```java
dp[1][2] = dp[0][3] = 1  (32)
dp[1][1] = dp[0][3] + dp[0][2] = 2  (31, 21)
dp[1][0] = dp[0][3] + dp[0][2] + dp[0][1] = 3  (30, 20, 10)
```

i=2,S[i]='I',升序

升序的限制只有j的范围是0 <= j <= n-i

```java
dp[2][1] = dp[1][1] + dp[1][0] = 5  (312, 213, 302, 203, 103)
dp[2][0] = dp[1][0] = 3  (301, 201, 102)
```
i=3

```java
dp[3][0] = dp[2][1] = 5 (3120, 2130, 3021, 2031, 1032)
```

总结状态转移方程：

降序：dp[i][j]=sum(dp[i-1][k]), j+1<= k <= n

升序：dp[i][j]=sum(dp[i-1][k]), 0 <= k <= j

### 代码

```java
class Solution {
    public int numPermsDISequence(String S) {
        int n=S.length();
        int M=(int)(10e9+7);
        int[][] dp=new int[n+1][n+1];
        Arrays.fill(dp[0],1);
        for (int i=1;i<=n;i++){
            if (S.charAt(i - 1) == 'D'){
                for (int j = n-i, cur=0; j>=0; j--){
                    dp[i][j] = cur = (cur+dp[i-1][j+1])%M;
                }
            }
            else {
                for (int j = 0, cur=0; j <= n-i; j++){
                    dp[i][j] = cur = (cur+dp[i-1][j])%M;
                }
            }
        }
        return dp[n][0];
    }
}
```