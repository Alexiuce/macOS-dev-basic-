## Dynamic Linking On OSX(关于macOS的动态链接)
![](https://img.shields.io/badge/platform-MacOSX-red.svg)

#### Static linking (静态链接)
静态链接就是我们平时说的链接,它发生在编译动作之后.我们的源代码经过编译器的编译后生成机器码,经过`链接`后形成一个独立的二进制文件.

那么静态链接(static linking)对与动态链接(dynamic linking)有怎样的意义呢?

#### Mach-O 文件的基本结构
* 头部(header structure)
* 加载区(load command)
* 段(segment)

#### 准备工具:

* clang


* xcrun

* xctest

* otool
> otool是对目标文件或者库文件的特定部分进行展示
  * otool -l 相当于Linux系统中的ldd工具,经常用来反编译工程中的依赖库信息.(获取加载区的信息)
  * otool -h filename : 获取文件的头部结构(header structure)信息
  * otool -tV filename : 查看汇编码
  