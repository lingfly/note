### 11. 盛最多水的容器
给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器，且 n 的值至少为 2。

### 思路

#### 双指针：
定义两个指针i=0,j=length-1，如果height[i] < height[j]，i向后一步，反之j向前一步，直到两指针在同一位置

#### 证明

所求结果即为两线围成的面积：s=(j-i)*min(height[i],height[j])

当i向后一步，height[i] < height[j]，意味着(i,i+1),(i,i+2)...(i,j-1)这些可能的结果被舍弃，需证明这些结果小于或等于s=(j-i)*height[i]

s'=(j'-i)*min(height[i],height[j'])，i < j' < j

如果height[j']>=height[i]，s'=(j'-i)*height[i]，小于s

如果height[j'] < height[i]，s'=(j'-i)*height[j']，小于s

所以当height[i] < height[j]，i向后一步是安全的。

j向前一步是i向后一步的镜像。

### 代码
```java
class Solution {
    public int maxArea(int[] height) {
        int len = height.length;
        int i = 0, j = len-1;
        int ans = 0;
        while(i<j){
            int a = j - i;
            int b = Math.min(height[i], height[j]);
            ans=Math.max(ans,a*b);
            if(height[i]<height[j]){
                i++;
            }
            else{
                j--;
            }
        }
        return ans;
    }
}
```