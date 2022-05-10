### 167. 两数之和 II - 输入有序数组
题目描述：在升序数组中找出两个数使其和等于给定值

思路：

因为数组是升序的，使用两个指针i，j，一个指向第一位，一个指向最后一位，逐一将两数之和与给定值比较，小于则指针i向后移一位，大于则指针j向前移一位，等于则说明找到答案

```java
class Solution {
    public int[] twoSum(int[] numbers, int target) {
        int len=numbers.length;
        int i=0,j=len-1;
        while(true){
            if(numbers[i]+numbers[j]==target){
                return new int[]{i+1,j+1};
            }
            else if(numbers[i]+numbers[j]<target){
                i++;
            }
            else{
                j--;
            }
        }
    }
}
```