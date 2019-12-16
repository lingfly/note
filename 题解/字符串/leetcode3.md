### 无重复字符的最长子串

给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。


### 思路
#### 滑动窗口：
定义一个左闭右开区间[i, j]，初始i=j

如果区间内没有字符和s[j]重复，意味着当前无重复字符的最长子串长度加一，j前进一步

如果区间内有字符和s[j]重复，意味着当前已经不满足无重复字符条件了；而这时，区间[i, j),[i, j-1),[i, j-2)...[i, i+1)这些子区间都已被证明无重复字符，那接着就验证[i+1, j)，[i+2, j)...[j-1, j)这些子区间是否满足；所以，i逐步前进直到没有字符重复

#### 复杂度
时间复杂度O(2n)

最坏的情况是一哥字符串里所有的字符都相同，会导致i和j都是逐步前进，要每个字符都访问2次


### 代码

```java
import java.util.HashSet;

public class Solution {
    public int lengthOfLongestSubstring(String s) {
        HashSet<Character> set = new HashSet<>();
        int res = 0, temp = 0;
        int i = 0, j = 0;
        int len = s.length();
        while(j < len && i < len){
            char c = s.charAt(j);
            if(set.contains(c)){
                i++;
                temp--;
                set.remove(s.charAt(i-1));
            }
            else {
                j++;
                set.add(c);
                temp++;
                res = Math.max(res, temp);
            }
        }
        return res;
    }
}
```
