
## git config

```sh
# 列出所有设置
git config --list

# 设置用户名和密码
git config --global user.name "lingfly"
git config --global user.email "zhengzhongwei0@gmail.com"

```

## 分支

1. git branch
```git
<!-- 创建分支 -->
git branch (branchname)

<!-- 显示当前分支 -->
git branch

<!-- 切换并创建分支，不加参数-b则仅切换分支 -->
git checkout -b (branchname)


```

## stash

```sh
# git stash把未提交的改动放入栈中，sava添加缓存的message
git stash save 'msg'

# 列出所有缓存
git stash list

# 弹出缓存，默认弹出第一个，可以用名称弹出指定缓存
git stash pop <stash>

# 将缓存应用到当前分支且不删除栈中的缓存
git stash apply

# 清除一个缓存,
git stash drop

# 清除所有缓存
git stash clear

# 基于缓存创分支
git stash branch <branchName> <stash>


```