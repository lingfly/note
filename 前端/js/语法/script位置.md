# script位置
## 嵌入代码
在使用 &lt;script&gt;元素嵌入代码时，无论标签在什么位置,都在执行完脚本后才进行页面的渲染（待考证）

```html
<!DOCTYPE html>
<html>
  <body>
	<p>页面</p>
	<!-- 在for循环执行完之后才显示 -->
	<script>
      for(var i = 0; i < 1000000000; i++){
    
      } 
      console.log("End of operation");
    </script>
  </body>

</html>
```

## 外部文件
通过 &lt;script&gt;标签引用外部文件时，则按脚本出现顺序加载


```js
//test.js

for(var i = 0; i < 1000000000; i++){
  
} 
console.log("End of operation");
```

```html
<!DOCTYPE html>
<html>
  <body>
    <script src="test.js"></script>
	<p>页面</p>
	<!-- 在for循环执行完之后才显示 -->
  </body>
</html>
```

```html
<!DOCTYPE html>
<html>
  <body>
	<p>页面</p>
	<!-- 在for循环执行之前显示 -->
    <script src="test.js"></script>
  </body>
</html>
```