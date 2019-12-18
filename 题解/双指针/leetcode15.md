### 15. 三数之和

给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。

### 思路

题目要求找到和为0的三元组，那么可以先假设已选定一个元素x，就转变为在剩余元素中寻找目标值为0-x的二元组，这时就可以用双指针寻找二元组

先将数组排序，排序有2个用处，一是得到有序数组，方便寻找二元组；
二是得到的数组相同的元素都相邻，方便过滤掉重复的三元组。

将x=nums[i],i=(0~lenth-2)依次选为已选定的元素，从i+1~length-1中选取二元组

### 代码

```java
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        int len = nums.length;
        List<List<Integer>> ans=new ArrayList<>();

        int left,right;
        for(int i = 0; i < len-2; ){
            left=i+1;
            right=len-1;
            while(left < right){
                if(nums[left]+nums[i]+nums[right] > 0){
                    while(left<right && nums[right] == nums[--right]);
                }
                else if(nums[left]+nums[i]+nums[right] < 0){
                    while(left<right && nums[left] == nums[++left]);
                }
                else{
                    ArrayList<Integer> list=new ArrayList<>();
                    list.add(nums[left]);
                    list.add(nums[i]);
                    list.add(nums[right]);
                    ans.add(list);
                    while(left<right && nums[left] == nums[++left]);
                }
            }
            while(i < len-2 && nums[i] == nums[++i]);
        }
        return ans;
    }
}
```