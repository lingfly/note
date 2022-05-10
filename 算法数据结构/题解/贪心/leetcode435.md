### 435. 无重叠区间

给定一个区间的集合，找到需要移除区间的最小数量，使剩余区间互不重叠。

注意:

可以认为区间的终点总是大于它的起点。
区间 [1,2] 和 [2,3] 的边界相互“接触”，但没有相互重叠。

### 思路

按贪心思想，选取所有尽可能短的不重叠区间，就能得到最大区间数，然后用总区间数-不重叠最大区间数

```java
    class Solution {
        public int eraseOverlapIntervals(int[][] intervals) {
            if(intervals.length==0)return 0;
            Interval[] ins=new Interval[intervals.length];
            for(int i=0;i<intervals.length;i++){
                ins[i]=new Interval(intervals[i][0],intervals[i][1]);
            }
            Arrays.sort(ins, new Comparator<Interval>() {
                @Override
                public int compare(Interval o1, Interval o2) {
                    if(o2.end==o1.end){
                        //终点相同，按起点降序
                        return o2.begin-o1.begin;
                    }
                    //按终点升序排序
                    return o1.end-o2.end;
                }
            });
            int end=ins[0].begin,count=0;
            for(Interval interval:ins){
                if(interval.begin>=end){
                    count++;
                    end=interval.end;
                }
                else{
                    continue;
                }
            }
            return intervals.length-count;
        }
        class Interval{
            int begin,end;
            public Interval(int a,int b){
                begin=a;
                end=b;
            }
        }
    }
```