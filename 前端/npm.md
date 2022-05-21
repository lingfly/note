
## 查看版本

npm -v

## 安装

1. 本地

    将安装包放在 ./node_modules 下（运行 npm 命令时所在的目录），如果没有 node_modules 目录，会在当前执行 npm 命令的目录下生成 node_modules 目录。

    npm install


2. 全局


    将安装包放在 /usr/local 下或者你 node 的安装目录。

    npm install -g

3.  将模块安装到项目目录下，并在package文件的dependencies节点写入依赖。

    npm install --save

4. 将模块安装到项目目录下，并在package文件的devDependencies节点写入依赖。

    npm install --save-dev

## 查看已安装的模块

npm list

npm list -g

npm list `<package>`


## 卸载

npm uninstall `<package>`



