## 分支

1. git branch
```sh
#  创建分支 
git branch (branchname)

#  显示当前分支 
git branch

#  切换并创建分支，不加参数-b则仅切换分支 
git checkout -b (branchname)

# 设置上游分支（与本地分支对应的远程分支）
git branch --set-upstream-to=origin/master


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