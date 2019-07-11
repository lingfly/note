### 213. 打家劫舍 II

你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都围成一圈，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

### 思路

这题直接建模是一个有向有环图，但是可以转化为有向无环图

1. 选第一个，则不选最后一个
2. 不选第一个，剩下的都可以选

去环之后，以d[i]表示在房屋i能偷到的最高金额，
状态转移方程d[i]=max(d[i-1],d[i-]+nums[i])


因为只需要用到最近的三个状态，所以不需要用数组保存，空间复杂度可以优化到O(1)


```java
class Solution {
    public int rob(int[] nums) {
        if(nums.length==0)return 0;
        if(nums.length==1)return nums[0];
        if(nums.length==2)return Math.max(nums[0],nums[1]);
        int pre1=nums[1],pre2=0;
        int ans1=0,ans2=0;
        ans1=Math.max(pre1,pre2);
        for(int i=2;i<nums.length;i++){
            ans1=Math.max(nums[i]+pre2,pre1);
            pre2=pre1;
            pre1=ans1;
        }
        pre1=Math.max(nums[0],nums[1]);pre2=nums[0];
        ans2=Math.max(pre1,pre2);
        for(int i=2;i<nums.length-1;i++){
            ans2=Math.max(nums[i]+pre2,pre1);
            pre2=pre1;
            pre1=ans2;
        }
        return Math.max(ans1,ans2);
    }
}
```