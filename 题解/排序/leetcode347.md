### 347. 前K个高频元素
给定一个非空的整数数组，返回其中出现频率前 k 高的元素

### 思路
桶排序

1. 用map记录所有数值出现的频率
2. 创建若干个桶，下标为频率，将各个数值分散到桶中
3. 从末尾开始遍历各个桶就可以得到频率最高的前k个数值

坑：同一频率下有多个数值的情况

```java
class Solution {
    public List<Integer> topKFrequent(int[] nums, int k) {
        //记录频率
        Map<Integer,Integer> map=new HashMap<>();
        for(int num:nums){
            map.put(num,map.getOrDefault(num,0)+1);
        }
        List<Integer>[] buckets=new ArrayList[nums.length+1];
        //分散到各个桶
        for(int key:map.keySet()){
            int frequency=map.get(key);
            if(buckets[frequency]==null){
                buckets[frequency]=new ArrayList<>();
            }
            buckets[frequency].add(key);
        }


        List<Integer> result=new ArrayList<>(k);
        //从末尾遍历
        for(int i=nums.length;i>0;i--){
            if(buckets[i]==null)continue;
            if(k>=buckets[i].size()){
                result.addAll(buckets[i]);
                k-=buckets[i].size();
            }
            
            if(k<=0)break;
        }
        return result;
    }
}
```