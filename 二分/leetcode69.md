### 69. x 的平方根

实现 int sqrt(int x) 函数。

计算并返回 x 的平方根，其中 x 是非负整数。

由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

### 思路

二分

写的时候上下界取值取mid+1，mid-1；确保上下界每一步都能向中值逼近并且最后能退出循坏

```java
class Solution {
    public int mySqrt(int x) {
        if(x<=1)return x;
        int l=0,r=x;
        int mid=0;
        while(l<=r){
            mid=(r+l)/2;
            int m=x/mid;
            if(m==mid){
                r=mid;
                break;
            }
            else if(m<mid){
                r=mid-1;
            }
            else{
                l=mid+1;
            }
        }
        return r;
    }
}
```