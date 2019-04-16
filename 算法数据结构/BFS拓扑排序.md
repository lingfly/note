### BFS拓扑排序
对有向图判环

设E=(u,v)表示一条u指向v的边，则E是v的一条入边，v的入度为1;

从入度为0的点开始遍历，设起点为u的边为E=(u,v),去掉E并对v的入度减一;

如果最后所有边入度为0，则有向图无环，可以进行拓扑排序;
反之有环。

```c++
queue<int>q;
for(int i=0;i<n;i++)  //n  节点的总数
    if(in[i]==0) q.push(i);  //将入度为0的点入队列
vector<int>ans;   //ans 为拓扑序列
while(!q.empty())
{
    int p=q.top(); q.pop(); // 选一个入度为0的点，出队列
    ans.push_back(p);
    for(int i=0;i<edge[p].size();i++)
    {
        //与入度为0的点相连的点的入度减一
        int y=edge[p][i];
        in[y]--;
        if(in[y]==0)
            q.push(y);  
    }
}
if(ans.size()==n)   
{
    for(int i=0;i<ans.size();i++)
        printf( "%d ",ans[i] );
    printf("\n");
}
else printf("No Answer!\n");   //  ans 中的长度与n不相等，就说明无拓扑序列
```
