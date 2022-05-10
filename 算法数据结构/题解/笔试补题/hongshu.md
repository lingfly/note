```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Main{

    public static void main(String[] args)throws FileNotFoundException{
        //System.out.println(new Solution().func());
        new Solution().func();
    }
    static class Solution {
        void func() throws FileNotFoundException {
            //Scanner in= new Scanner(System.in);
            Scanner in= new Scanner(new File("C:\\Users\\lingfly\\IdeaProjects\\first\\src\\in.txt"));
            int n=in.nextInt();
            int[] nums=new int[n+1];
            for (int i = 0; i < n; i++){
                nums[i]=in.nextInt();
            }
            int[] dp=new int[n];
            int cnt=0;
            int pre2 = 0, pre1 = 0;
            int cnt2=0,cnt1=0;
            for (int i = 0; i < nums.length; i++) {
                int cur = Math.max(pre2 + nums[i], pre1);
                if (pre2 + nums[i]>pre1) {
                    cnt=cnt2+1;
                    cnt2=cnt1;
                    cnt1=cnt;

                }else {

                }
                pre2 = pre1;
                pre1 = cur;
            }

            System.out.printf("%d %d",pre1,cnt);
        }
    }

}
```

```java
import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Main{

    public static void main(String[] args)throws FileNotFoundException{
        System.out.println(new Solution().func());
        //new Solution().func();
    }
    static class Solution {
        int x,y,n;
        int[][] map;
        int ans;
        int func() throws FileNotFoundException {
            //Scanner in= new Scanner(System.in);
            Scanner in= new Scanner(new File("C:\\Users\\lingfly\\IdeaProjects\\first\\src\\in.txt"));
             x=in.nextInt()+500;
             y=in.nextInt()+500;
             n=in.nextInt();
             ans=0;
             map=new int[1000+10][1000+10];
            for (int i=0;i<n;i++){
                int x1=in.nextInt()+500;
                int y1=in.nextInt()+500;
                map[x1][y1]=1;
            }
            final int[][] direction = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
            final int m = map.length, n = map[0].length;
            Queue<Pair<Integer, Integer>> queue = new LinkedList<>();
            queue.add(new Pair<>(0+500, 0+500));
            int pathLength = 0;
            while (!queue.isEmpty()) {
                int size = queue.size();
                pathLength++;
                while (size-- > 0) {
                    Pair<Integer, Integer> cur = queue.poll();
                    int cr = cur.getKey(), cc = cur.getValue();
                    map[cr][cc] = 1; // 标记
                    for (int[] d : direction) {
                        int nr = cr + d[0], nc = cc + d[1];
                        if (nr < 0 || nr >= m || nc < 0 || nc >= n || map[nr][nc] == 1) {
                            continue;
                        }
                        if (nr == x && nc == y) {
                            return pathLength;
                        }
                        queue.add(new Pair<>(nr, nc));
                    }
                }
            }
            return pathLength;

        }
//        void dfs(int r,int c,int dept){
//            vis[r][c]=1;
//            if (r < 0 || r > x || c < 0 || c > y || map[r][c] == 1) {
//                return;
//            }
//            if (r==x&&c==y){
//                ans=Math.min(ans,dept);
//            }
//            for (int[] d : direction) {
//                int u=r + d[0];
//                int v=c + d[1];
//                if (u < 0 || u > x || v < 0 || v > y || map[u][v] == 1)continue;
//                if (vis[u][v]!=1){
//                    dfs(r + d[0], c + d[1],dept+1);
//                }
//
//
//            }
//
//        }
    }

}
```