## 快捷键
1. Shift+F6 (重构 | 重命名 )

2. 要展开选区，请按   Ctrl   W   。每次按   Ctrl   W   时，选区将扩展到代码的其他区域。
例如，选区从一个方法名称扩展到调用此方法的表达式，然后扩展到整个语句，继而扩展到包含的块，等等。

3. 要以有用的结构快速包装代码块，请在编辑器中将其选中，然后按   Ctrl   Alt   T   (  代码 | 环绕方式  )，。
可用选项或包装器的列表具有上下文相关的特点，并且取决于语言。例如，可以使用标记环绕   html   块，等等。
快捷键被占用时按 Ctrl   Alt  Win  T

4. 要快速查看文本光标处的类或方法的文档，请按   Ctrl   Q   (  视图 | 快速文档  )

5. 代码 | 上移/下移语句 操作对于重新组织代码行非常有用，例如，可以让变量声明更靠近变量用法。
选择一段代码，然后按   Ctrl   Shift   ↑   或   Ctrl   Shift   ↓  。
在编辑器中没有选择任何内容时，将移动文本光标位置处的代码行。

6. 要导航至抽象方法的实现，请将文本光标置于声明中的用法或名称处，然后按   Ctrl   Alt   B  。

7. 在编辑器中按   Ctrl   D   可复制所选块，或在未选择块时复制当前行。

8. 按   Ctrl   E   (  视图 | 最近的文件   )可查看最近打开的文件列表。

9. 您可以使用   Ctrl   F12   (  导航 | 文件结构   )在当前编辑的文件中快速导航。
文件结构会显示当前类的成员列表。要导航到某个元素，请选择该元素，然后按   Enter   或   F4  。
要轻松定位列表中的条目，请开始输入其名称。

10. 按   Ctrl   E   (  视图 | 最近的文件   )可查看最近打开的文件列表

## 外部工具

### IDEA外部工具生成jni header

1. Program: -jni -classpath $OutputPath$; -d $FileDir$ $FileClass$
2. working directory: $ProjectFileDir$