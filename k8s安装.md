
## 准备

1. 禁用selinux

```sh
setenforce 0
```

2. 关闭swap

```
swapoff -a
```

## 安装docker

1. 
```sh
yum install -y docker-ce-19.03.11
```

2. 配置镜像

```
$ vi /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "registry-mirrors" : [
    "https://ot2k4d59.mirror.aliyuncs.com/"
  ]
}
```

## 安装kubeadm

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
        http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```

```sh
# --disableexcludes 禁掉除了kubernetes之外的别的仓库
yum install -y kubelet-1.19.3 kubeadm-1.19.3 kubectl-1.19.3 --disableexcludes 禁掉除了kubernetes之外的别的仓库

kubeadm version
```

## 初始化集群

1. 导出配置
```sh 
kubeadm config print init-defaults > kubeadm.yaml
```

```conf
apiVersion: kubeadm.k8s.io/v1beta2
bootstrapTokens:
- groups:
  - system:bootstrappers:kubeadm:default-node-token
  token: abcdef.0123456789abcdef
  ttl: 24h0m0s
  usages:
  - signing
  - authentication
kind: InitConfiguration
localAPIEndpoint:
  # apiserver 节点内网IP
  advertiseAddress: 192.168.0.10
  bindPort: 6443
nodeRegistration:
  criSocket: /var/run/dockershim.sock
  name: localhost.localdomain
  taints:
  - effect: NoSchedule
    key: node-role.kubernetes.io/master
---
apiServer:
  timeoutForControlPlane: 4m0s
apiVersion: kubeadm.k8s.io/v1beta2
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
controllerManager: {}
dns:
  type: CoreDNS
etcd:
  local:
    dataDir: /var/lib/etcd
# 修改成阿里云镜像源
imageRepository: registry.aliyuncs.com/google_containers
kind: ClusterConfiguration
kubernetesVersion: v1.19.0
networking:
  dnsDomain: cluster.local
  serviceSubnet: 10.96.0.0/12
scheduler: {}
```