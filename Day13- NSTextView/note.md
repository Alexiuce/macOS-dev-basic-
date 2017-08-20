# NSTextView 文本编辑控件

### NSTextField 与NSTextView的差异
* 父类不同
  > NSTextField 继承自 NSControl  
   NSTextView 继承自 NSText
* 对特定键盘的响应事件不同

  >  enter 键: NSTextField结束编辑,而NSTextView是换行 
 Tab 键: NSTextField中会切换到下个控件,NSTextView则在文本中插入Tab字符
* 对特定的符号显示效果
  > ' 和 " 在NSTextField中都可以正常显示,但在NSTextView中,默认会将直引号(英文引号)变成弯引号(中文引号)
  NSTextField: 轻量级控件,提供简单的文字输入处理.
   NSTextView: 重量级控件,提供更复杂的文字处理功能和设置选项.
* 对属性文字(富文本)支持不同

  > NSTextField中,编辑状态,不支持富文本
  NSTextView编辑状态支持富文本