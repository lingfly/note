

#

### box-sizing

1. content-box:width 与 height 只包括内容的宽和高
2. border-box:width 和 height 属性包括内容，内边距和边框，但不包括外边距。


## 浮动

### 不能撑起父元素的高度，导致父元素高度塌陷；但父元素的宽度依然束缚浮动的元素

1. 方案一： 给父元素指定高度。
2. 方案二： 给父元素也设置浮动，带来其他影响。
3. 方案三： 给父元素设置 overflow:hidden 。
4. 方案四： 在所有浮动元素的最后面，添加一个块级元素，并给该块级元素设置 clear:both 。
5. 方案五： 给浮动元素的父元素，设置伪元素，通过伪元素清除浮动，原理与方案四相同。===> 推荐使用

    ```css
    .parent::after {
    content: "";
    display: block;
    clear:both;
    }
    ```


## flex

### 开启flex

```css
body {
    display: flex;
}
```

 开启felx后所有子元素称为伸缩项目(flex item)，伸缩项目自动块状化


### 跳整主轴方向

修改主轴，侧轴（交叉轴）也随之改变
```css
/* 默认：水平从左到右 */
flex-direction: row 

/* 水平从右到左 */
flex-direction: row-reverse

/* 垂直从上到下 */
flex-direction: column

/* 垂直从下到上 */
flex-direction: column-reverse
```

### 主轴换行方式

```css
/*默认值： 不换行 */
flex-wrap: nowrap;

/* 换行 */
flex-wrap: wrap;

/* 反向换行 */
flex-wrap: wrap-reverse;
```

### flex-flow

复合属性，包含了flex-direction和flex-wrap，值没有顺序要求

### 主轴对齐方式

```css
/* 默认值， 主轴的起始位置 */
justify-content: flex-start;

/* 主轴的结束位置 */
justify-content: flex-end;

/* 中间对齐 */
justify-content: center;

/* item均匀分布，item间距是item-边缘间距的两倍 */
justify-content: space-around;

/* item均匀分布，item间距相等，item-边缘间距为0 */
justify-content: space-between;

/* item均匀分布，item间距、item-边缘间距相等 */
justify-content: space-evenly;

```

### 单行的侧轴对齐方式

```css
/* 侧轴的起始位置 */
align-items: flex-start;

/* 侧轴的结束位置 */
align-items: flex-end;

/* 中间对齐 */
align-items: center;

/* 基线对齐（文字的下边线） */
align-items: baseline;

/* 默认值， 拉伸到整个父容器，前提是item没有设置高度 */
align-items: stretch;

```

### 多行的侧轴对齐方式

```css
/* 侧轴的起始位置 */
align-content: flex-start;

/* 侧轴的结束位置 */
align-content: flex-end;

/* 中间对齐 */
align-content: center;

/* item均匀分布，item间距是item-边缘间距的两倍 */
align-content: space-around;

/* item均匀分布，item间距相等，item-边缘间距为0 */
align-content: space-between;

/* item均匀分布，item间距、item-边缘间距相等 */
align-content: space-evenly;

/* 默认值， 拉伸到整个父容器，前提是item没有设置高度 */
align-content: stretch;
```

### 水平垂直居中的设置

```css
/* 方式1. flex布局下设置主轴中间对齐，单行的侧轴中间对齐 */
justify-content: center;
align-items: center;

/* 方式2： 父元素flex布局下，子元素设置margin*/
margin: auto;

```

### 基准长度

```css
/* 设置item在主轴上的基准长度；如果主轴是横向，宽会失效；如果主轴是纵向，高会失效 */
flex-basis: 300px;

/* 默认值，auto，使用原本的宽或高 */
flex-basis: auto;
```

### flex-grow

定义item的放大比例，默认0

### flex-shrink

<!-- 前提是没有设置换行 -->
定义item的压缩比例，默认1


### flex复合属性

<!-- 对顺序要求：flex-grow flex-shrink flex-basis -->
```css
/* 可以简写为flex: auto */
flex: 1 1 auto; 

/* 可以简写为flex: 1 */
flex: 1 1 0; 

/* 可以简写为flex: none */
flex: 0 0 auto; 

/* 可以简写为flex: 0 auto */
flex: 0 1 auto; 
```

### item排序

order属性定义项目的排列顺序，数值越小越靠前，默认0

```css
order: 0;
```

### 单独对齐
调整item在侧轴方向上的对齐方式

```css
/* 默认值auto，表示继承父元素的align-items */
align-self: center;
```

