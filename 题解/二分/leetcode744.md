### 744. 寻找比目标字母大的最小字母
给定一个只包含小写字母的有序数组letters 和一个目标字母 target，寻找有序数组里面比目标字母大的最小字母。

数组里字母的顺序是循环的。举个例子，如果目标字母target = 'z' 并且有序数组为 letters = ['a', 'b']，则答案返回 'a'。

### 思路

二分

坑：多个字母相同的情况

```java
class Solution {
    public char nextGreatestLetter(char[] letters, char target) {
        int len=letters.length;
        if(letters[len-1]<=target)return letters[0];
        int l=0,r=len-1;
        while(l<=r){
            int mid=(l+r)/2;
            if(letters[mid]==target){
                r=mid;
                break;
            }
            else if(letters[mid]>target){
                r=mid-1;
            }
            else{
                l=mid+1;
            }
        }
        while((r>=0)&&(r+1<len)&&letters[r+1]==letters[r])r++;
        return letters[r+1];
    }
}
```