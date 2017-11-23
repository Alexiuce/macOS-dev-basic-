![](https://ws1.sinaimg.cn/large/006tKfTcgy1flrzbqtpsuj30v60js7bl.jpg)
## Dynamic Linking On OSX(关于macOS的动态链接)
![](https://img.shields.io/badge/platform-MacOSX-red.svg)


#### Static Libraries(静态库)
当你链接一个静态库,这个库的内容就会在编译的时候,全部拷贝到你的应用项目中,就好像是你自己写的代码一样.

#### Dynamic Libraries(动态库)
当你链接了一个动态库,其实并没有与这个库有紧密的关联,只是链接器简单的标记了一下你所用到的这个动态库里的函数(或方法).当你的应用程序加载运行的时候,动态链接器才会装载你链接的这个库.

#### Static linking (静态链接)
静态链接就是我们平时说的链接,它发生在编译动作之后.我们的源代码经过编译器的编译后生成机器码,经过`链接`后形成一个独立的二进制文件.

那么静态链接(static linking)对与动态链接(dynamic linking)有怎样的意义呢?

#### Mach-O 文件的基本结构
* 头部(header structure)
* 加载区(load command)
* 段(segment)

#### 准备工具:

* clang
将源码文件生成汇编内容的文件
例如:

	```
	clang -S abc.c -o abc.s   // 将abc.c 源码文件 转为 汇编文件 文件名为abs.s
	```

* xcrun

* xctest

* otool
> otool是对目标文件或者库文件的特定部分进行展示
  * otool -l 相当于Linux系统中的ldd工具,经常用来反编译工程中的依赖库信息.(获取加载区的信息)
  * otool -h filename : 获取文件的头部结构(header structure)信息
  * otool -tV filename : 查看汇编码


#### 编译与汇编
* 关于 x86 CPU architecture
cpu中有大量的寄存器(至少100个),幸运的是开发者(即便是使用汇编语言的开发者)几乎只需要使用20个左右就够了.  

  同一个寄存器可以根据名字的不同来进行编址: 也就是说,对同一个寄存器使用不同的名字可以读取或写入寄存器不同的地址空间.例如对64位的通用寄存器来说: 
  * rax: 代表寄存器的64位地址空间         
  * eax: 代表寄存器的32位低地址空间
  * ax:  代表寄存器的16位低地址空间
  * ah: 代表寄存器次低8位的地址空间(也就是al上的8位地址空间)
  * al: 代表寄存器的最低的8位地址空间()
  寄存器通过不同名称获取不同的操作空间是为了方便处理不同的数据类型和节省寄存器空间(毕竟cpu的存储空间十分宝贵).
  
  * rsp:


  