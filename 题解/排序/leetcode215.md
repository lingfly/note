### 215. 数组中的第K个最大元素
题目描述：在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

### 思路
1. 题目中前k大是从1开始的，而数组是从0开始，k=nums.length-k把k转换为升序数组中的前k大
2. 快速排序的切分过程返回的轴值下标mid，mid左边都比轴值小，右边都比轴值大，轴值就是前mid大的值，所以求mid=k时nums[k]




```java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        int mid=0;
        int l=0,h=nums.length-1;
        k=nums.length-k;
        while(true){
            mid=partition(nums,l,h);
            if(mid==k)break;
            else if(mid<k){
                l=mid+1;
            }
            else{
                h=mid-1;
            }
        }
        return nums[k];
    }
        private static int partition(int[] nums,int l,int h){
        int mid=nums[l];
        int i=l+1,j=h;
        while(i<=j){
            while(i<=h&&nums[i]<=mid)i++;
            while(j>l&&nums[j]>=mid)j--;
            if(i>=j)break;
            //交换nums[i]和nums[j]
            int temp=nums[i];
            nums[i]=nums[j];
            nums[j]=temp;
        }
        //交换nums[l]和nums[j]
        nums[l]=nums[j];
        nums[j]=mid;
        return j;
    }
}
```