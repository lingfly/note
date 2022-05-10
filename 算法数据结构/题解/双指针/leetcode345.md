### 345. 反转字符串中的元音字母


注意：
1. 下标越界
2. 元音数为奇数

```java
class Solution {
    private final static HashSet<Character> vowels = new HashSet<>(
            Arrays.asList('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'));

    public String reverseVowels(String s) {
        int i = 0, j = s.length() - 1;
        char[] result = new char[s.length()];
        while (i <= j) {
            char ci = s.charAt(i);
            char cj = s.charAt(j);
            if (!vowels.contains(ci)) {
                result[i++] = ci;
            } else if (!vowels.contains(cj)) {
                result[j--] = cj;
            } else {
                result[i++] = cj;
                result[j--] = ci;
            }
        }
        return new String(result);
    }
}
```

```java
class Solution {
    public String reverseVowels(String s){
        int i=0,j=s.length()-1;
        List<Character> vowels = Arrays.asList('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
        char[] result=new char[s.length()];
        while(true){
            while(i<s.length()&&!vowels.contains(s.charAt(i))){
                result[i]=s.charAt(i);
                i++;
            }
            while(j>=0&&!vowels.contains(s.charAt(j))){
                result[j]=s.charAt(j);
                j--;
            }
            if(i>j)break;
            result[i]=s.charAt(j);
            result[j]=s.charAt(i);
            i++;j--;

        }
        return new String(result);
    }
}
```