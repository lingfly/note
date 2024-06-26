
0527 18.00-20.30
0407 18.00-20.30



## todo






```sh
SHELL=/usr/bin/bash
PATH=/usr/bin
MAILTO=root
12 20 * * * root /home/aliyun/update_version.sh 
```


### jp todo



## 

1. manager节点数量为奇数
2. 挂载目录，
3. 一键更新：一键更新镜像tag


## 流程

1. 流程怎么启动？启动条件有哪些？
2. 任务受托人拒绝任务，可以重新指派吗？

### 

1. 创建ro时填的uuid会被随机生成的uuid覆盖
2. /child_all接口返回的数据不对

## k8s

空间和机器有关系吗？

文件映射，nfs，master管理还是要到节点管理

1. 内网部署/cicd是不是用k8s？私有部署是k8s吗？
2. 怎么部署一套新的环境
   * 我一开始只有服务镜像，我要做哪些能让服务起来？
   * 怎么修改配置文件？配置文件需要手动放到各个服务器吗？
   * 怎么指定服务器？新服务器要怎么加入集群？怎么在同一台服务器部署多套环境？
   * 更新的时候我们一般只需要修改java服务的镜像版本，有方式可以快速更新吗？
   * 我需要用k8s原生命令来完成这样步骤吗？




###


```java
import java.util.*;

class DirectedGraph {
    private Map<String, List<String>> graph;

    public DirectedGraph() {
        graph = new HashMap<>();
    }

    public void addEdge(String u, String v) {
        graph.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
    }

    public List<String> getExclusiveSubtree(String start) {
        Set<String> reachableFromStart = new HashSet<>();
        dfs(start, reachableFromStart, new HashSet<>());

        List<String> exclusiveNodes = new ArrayList<>();
        for (String node : reachableFromStart) {
            if (node.equals(start)) continue;
            Set<String> reachableFromOthers = new HashSet<>();
            for (String key : graph.keySet()) {
                if (!key.equals(start)) {
                    dfs(key, reachableFromOthers, new HashSet<>());
                }
            }
            if (!reachableFromOthers.contains(node)) {
                exclusiveNodes.add(node);
            }
        }
        return exclusiveNodes;
    }

    private void dfs(String node, Set<String> visited, Set<String> path) {
        if (visited.contains(node) || path.contains(node)) {
            return;
        }
        visited.add(node);
        path.add(node);
        List<String> neighbors = graph.get(node);
        if (neighbors != null) {
            for (String neighbor : neighbors) {
                dfs(neighbor, visited, path);
            }
        }
        path.remove(node);
    }

    public static void main(String[] args) {
        DirectedGraph graph = new DirectedGraph();
        graph.addEdge("A", "B");
        graph.addEdge("A", "C");
        graph.addEdge("B", "D");
        graph.addEdge("C", "E");
        graph.addEdge("D", "E");
        graph.addEdge("C", "F");
        graph.addEdge("E", "B");

        // 查询节点及其不能通过其他节点到达的子节点
        List<String> exclusiveSubtreeB = graph.getExclusiveSubtree("B");
        System.out.println("Exclusive nodes for B: " + exclusiveSubtreeB);

        List<String> exclusiveSubtreeC = graph.getExclusiveSubtree("C");
        System.out.println("Exclusive nodes for C: " + exclusiveSubtreeC);
    }
}
````

```
节点：A, B, C, D, E,F
边：
A -> B
A -> C
B -> D
D -> E
C -> F
E -> B
C -> G
E -> G
G -> H

```


### 

a 140 155

grpc total 101
