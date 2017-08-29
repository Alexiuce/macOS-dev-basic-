### NSViewController - 视图控制器

* 在目前的macOS 系统中，cocoa没有提供iOS系统中UITabBarController 和UINavigaitonController 对应的控制器

> macOS 10.10 之前： 控制器对view的管理方式是重写loadView方法（需要调用super方法），在这个方法中加载nib视图，然后赋值给控制器的view属性 




> macOS 10.10 之后 ： loadView方法会自动在bundle中寻找与控制器名字相同的nib文件

**对view的生命周期的管理** (macOS 10.10 + )

* viewDidLoad()
* viewWillAppear()
* viewDidAppear()
     * updateViewConstraints()

     * viewWillLayout()

     * viewDidLayout()
* viewWillDisappear()
* viewDidDisappear() 


**NSViewController转场**  

      transition

**PresentControler的四种方式**

    modal : 以独立窗口的形式显示新的控制器界面
    sheet  : 内嵌在当前window中的形式显示新的控制器界面
    popover : 已popover形式显示
    custom   : 自定义显示方式
    
 


