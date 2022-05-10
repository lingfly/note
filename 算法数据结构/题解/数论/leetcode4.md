### 4. 寻找两个有序数组的中位数

给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。

### 思路
题目要求时间复杂度为O(log(m+n)),就是要求在两个有序数组中使用二分寻找中位数

中位数有这样的性质：

**将所有数以中位数为中心分为两部分，左边的数都小于中位数，右边的数都大于中位数**

假定第一个数组为A,长度为m；第二个数组为B,长度为n。

将A从任意位置i分为两部分，左边为0~i-1，右边为i~m-1；

将B从任意位置j分为两部分，左边为0~j-1，右边为j~n-1。

如果这样的左右划分符合中位数性质，那么：
1. i+j=m-i+n-j(或i+j=m-i+n-j+1)
2. A[i-1]<=B[j] 且 B[j-1]<=A[i]

令:
1. i=(0~m), j=(m+n+1)/2-i;
2. m<=n

为什么j=(m+n+1)/2-i?

这个j是从i+j=m-i+n-j+1中得出，当m+n为奇数时，左右两部分长度就是这个等式，从而得到正确的j；同时也意味着m+n为奇数时中位数在左边产生。

当m+n为偶数时，+1会因为除以2而消去，所以也能得到正确的j。

为什么要m<=n?

因为如果n>m，i取最大值m时，j为负数。

计算过程为对i在0~m内进行二分，当A[i-1]>B[j]，说明i太大了；
当B[j-1]>A[i]，说明i太小了。

边界条件：

```
m<=n,i<m 推导 j=(m+n+1)/2-i > (m+n+1)/2-m 
>= (m+n+1)/2-i > (2m+1)/2-m  >= 0;
```
结论：i < m 时，j > 0; i > 0 时，j < n

i，j超出边界时导致数组越界，这时忽略条件判断

### 代码

```java
class Solution {
    public double findMedianSortedArrays(int[] A, int[] B) {
        int m = A.length;
        int n = B.length;
        if (m > n) { // to ensure m<=n
            int[] temp = A; A = B; B = temp;
            int tmp = m; m = n; n = tmp;
        }
        int iMin = 0, iMax = m, halfLen = (m + n + 1) / 2;
        while (iMin <= iMax) {
            int i = (iMin + iMax) / 2;
            int j = halfLen - i;
            if (i < iMax && B[j-1] > A[i]){
                iMin = i + 1; // i is too small
            }
            else if (i > iMin && A[i-1] > B[j]) {
                iMax = i - 1; // i is too big
            }
            else { // i is perfect
                int maxLeft = 0;
                if (i == 0) { maxLeft = B[j-1]; }
                else if (j == 0) { maxLeft = A[i-1]; }
                else { maxLeft = Math.max(A[i-1], B[j-1]); }
                if ( (m + n) % 2 == 1 ) { return maxLeft; }

                int minRight = 0;
                if (i == m) { minRight = B[j]; }
                else if (j == n) { minRight = A[i]; }
                else { minRight = Math.min(B[j], A[i]); }

                return (maxLeft + minRight) / 2.0;
            }
        }
        return 0.0;
    }
}

```