## Dynamic Linking On OSX(关于macOS的动态链接)
![](https://img.shields.io/badge/platform-MacOSX-red.svg)

#### Static linking (静态链接)
静态链接就是我们平时说的链接,它发生在编译动作之后.我们的源代码经过编译器的编译后生成机器码,经过`链接`后形成一个独立的二进制文件.

那么静态链接(static linking)对与动态链接(dynamic linking)有怎样的意义呢?

#### 准备工具:

* clang
* xcrun
* xctest
* otool
