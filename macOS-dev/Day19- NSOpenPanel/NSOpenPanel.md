# NSOpenPanel    打开文件路径选择控件

* 继承自`NSSavePanel`(**保存文件路径选择控件**)
* 是一种特殊的`NSWindow`(`NSSavePanel` <- `NSPanel` <- `NSWindow`)  


### 显示方式
* 内嵌式:
> 在当前Window中已sheet的形式显示
 调用方法: `beginSheetModal`
返回结果: 在闭包中执行回调
* 独立式:
> 以独立的窗口显示
调用方法: `runModal`
返回结果: 根据调用方法的返回值(`NSModalResponseOK`)进行判断处理
### 常用属性

* `prompt` : 默认按钮的文字(默认值为"open")
* `message` : 提示文字
* `canChooseDirectories`: 是否支持选择文件夹
* `allowsMultipleSelection`: 是否支持多选
* `canChooseFiles`: 是否支持选择文件
* `directoryURL` : 默认文件夹路径
* `canCreateDirectories` : 是否支持新建文件夹

### 沙盒环境

> 在沙盒环境中,NSOpenPanel是处于在独立的进程(不是Appkit创建的),当用户选择文件后,由macOS操作系统将用户选择的文件,添加到App的沙盒中

