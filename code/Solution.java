
import java.util.Collections;

class Solution {
    public void nextPermutation(int[] nums) {
        int len = nums.length;
        int i = len-1;
        while(i > 0){
            if(nums[i]>nums[i-1]){
                int temp = nums[i];
                nums[i] = nums[i-1];
                nums[i-1] = temp;
                break;
            }
            else{
                i--;
            }
        }
        if(i==0){
            int temp;
            int start = 0, end = len-1;
            while(start < end){
                temp = nums[start];
                nums[start] = nums[end];
                nums[end] = temp;
            }
        }
    }
}