# wireshark

## tcpdump

```sh
# 生成cap文件
tcpdump -i <网卡> -w net.cap

# -s 0 参数告诉 tcpdump 捕获整个数据包而不进行截断。
tcpdump -i eth0 -s 0 -w /tmp/eth0.pcap
```

## 报文过滤

### 过滤符

1. eq `==`

2. lt `<`

3. le `<=`

4. gt `>`

5. ge `>=`

6. 包含 contains

### 过滤协议

1. http

2. tcp

## ip

1. ip.src

2. ip.dst

### http请求

1. http.request

    1.1 http.request.uri

2. http. response

### 过滤端口

tcp.port == 8080