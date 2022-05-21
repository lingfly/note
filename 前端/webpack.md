

## 查看版本

webpack --version

## 打包

### 3.x版本

`webpack <input> <output>`

input为构建项目的入口，output为打包输入文件

举例：

```sh
webpack ./src/main.js ./dist/bundle.js
```

### 4.x及以上版本

`webpack <entry> <entry> -o <output>`

entry为构建项目的入口，可以指定多个

output为打包输入文件的路径，输出文件名为entry的文件名


举例：

```sh
webpack ./src/main.js -o ./dist
```

### 警告：The 'mode' option has not been set

如果在没有配置mode的情况下打包，则会以生产模式打包，生成的是生产版的代码(即不留空格，全是一行代码没注释和警告)

配置方式：在项目根目录上创建一个webpack.config.js文件,填写如下配置

```js
// webpack.config.js
// mode可选值：development，production，none
module.exports={
    mode: 'development',
}
```



## 打包参数

```js
// webpack.config.js

const path = require('path');

module.exports={
    mode: 'development',

    entry: "./src/main.js",//设置入口，支持string、object、array三种类型
    // entry: ["./app/entry1", "./app/entry2"],
    // entry: {
    //     a: "./app/entry-a",
    //     b: ["./app/entry-b1", "./app/entry-b2"]
    // },

    output: { //设置出口
        path: path.resolve(__dirname, "dist"), //path必须为绝对路径
        filename: "bundle.js", // string
        // filename: "[name].js", //用于多个入口点(entry point)
    }
}
```

```json
// package.json

{
  "scripts": {
    
    //执行npm run build时运行的命令
    "build": "webpack"
  }
}
```

## css-loader

css-loader： 解析CSS文件后，使用 import 加载，并且返回 CSS 代码

style-loader： 将模块的导出作为样式添加到 DOM 中

```js
//main.js
//在入口文件引入css文件
require('./css/a.css')
```

```js
//webpack.config.js
module.exports={
    module: {
        rules: [
            {
              test: /\.css$/,//正则表达式
              use: [ 'style-loader', 'css-loader' ]//多个loader时从右向左写
            }
          ]
    }
}
```