
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


## reset

```sh
git reset <--mixed> <commit>
```

1. hard: 重置工作区和暂存区，也就是说，如果使用hard参数，当前项目下所有已修改和已add到暂存区的内容都会被丢弃

2. mixed: 重置暂存区，已add到暂存区的内容会被丢弃

3. soft: 只重置HEAD指针，工作区和暂存区已有的内容不变，已commit的内容回退后放到暂存区

4. keep: 重置工作区，已add到暂存区的内容不会改变，已修改但未add的内容会被丢弃

## reflog

查询所有可引用的历史版本，`git log`只能查到HEAD之前的版本，使用`git reset`后HEAD改变，被reset的版本用`git log`就查不到了。

若误执行了reset操作，可以用`git reflog`查询reset前的版本，然后重新reset到误操作前的版本

## push

本地版本和远程版本不一致时可以使用强制push使远程接受本地的提交，比如push了多个commit之后，本地把多个commit reset后合并成一个commit，然后push，这是远程版本不一致，不强制的话需要先把reset掉那几个commit从远程拉下来merge，然后才能push

```sh
# 强制push
git push orign master -f
```

## restore

```sh
# 把暂存区的文件改为未暂存，保留工作区的修改（如果暂存区和工作区有冲突，会取工作区）
git restore --staged <file>

# 把暂存区的文件改为未暂存，不保留工作区的修改
git restore <file>
```