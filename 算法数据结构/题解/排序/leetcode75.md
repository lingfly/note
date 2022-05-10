### 75. 颜色分类

给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

注意:
不能使用代码库中的排序函数来解决这道题。

### 思路1
计数排序
1. 扫描一次数组，将每个数的出现次数记录在count数组中，count[i]表示i出现count[i]次
2. count数组的大小=原数组元素最大值-最小值+1，空间复杂度是常数
3. 在扫描一次count数组，将出现元素放在原数组中

```java
class Solution {
    public void sortColors(int[] nums) {
        int[] count=new int[3];
        for(int i=0;i<nums.length;i++){
            count[nums[i]]++;
        }
        int a=0;//下标
        for(int i=0;i<3;i++){
            for(int j=0;j<count[i];j++){
                nums[a++]=i;
            }
        }
    }
}
```
### 思路2
快速排序三向切分优化

在切分时将所有元素分为三部分，相较于轴值pivot分别是小于，等于和大于，因为本题数据存在大量重复元素，所有三向切分有较高的性能

注：本题中，计数排序和快速排序耗时相同，但快速排序耗内存多一点，我觉得如果用栈写法的话内存占用还能优化一点

```java
class Solution {
    public void sortColors(int[] nums) {
        sort(nums,0,nums.length-1);
    }
    void sort(int[] nums,int l,int h){
        if(l>=h)return;
        int pivot=nums[l];
        int i=l+1,lt=l,gt=h;
        
        while(i<=gt){
            //小于则移到轴值左边
            if(nums[i]<pivot){
                swap(nums,i++,lt++);
            }
            //大于移到轴值右边
            else if(nums[i]>pivot){
                swap(nums,i,gt--);
            }
            else{
                i++;
            }
        }
        sort(nums,l,lt-1);
        sort(nums,gt+1,h);
    }
    void swap(int[] nums,int a,int b){
        int t=nums[a];
        nums[a]=nums[b];
        nums[b]=t;
    }
}
```