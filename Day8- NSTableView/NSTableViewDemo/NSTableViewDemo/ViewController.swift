//
//  ViewController.swift
//  NSTableViewDemo
//
//  Created by Alexcai on 2017/8/17.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

let ReusedKey = "myCellView"

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 自定义的View ,需要先注册,后使用
        let myNib = NSNib(nibNamed: "MYCellView", bundle: nil)
        tableView.register(myNib!, forIdentifier: ReusedKey)
        
        
        // 设置NSTableView的行高
        tableView.rowHeight = 80

        // Do any additional setup after loading the view.
    }
}


// 数据源方法(返回NSTableView有多少行)
extension ViewController : NSTableViewDataSource{
    // 返回行数
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 13
    }
}
// 代理方法 (返回NSTableView每行的View,以及交互)
extension ViewController : NSTableViewDelegate{
    // 这个方法返回每行的View(就是我们之前注册的View)
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = tableView.make(withIdentifier: ReusedKey, owner: nil) as! MYCellView
        
        cellView.pictureView.image = NSImage(named: "headIcon" + "\(row)")
        
        cellView.nameLabel.stringValue = "\(row) : \(tableColumn!.identifier)"
        
        return cellView
        
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("用户操作了点选cell ")
        // 选中的行数
//        tableView.selectedRow
        // 选中的列数
//        tableView.selectedColumn
        // 获取选中的View
        let selectedView =  tableView.view(atColumn: tableView.selectedColumn, row: tableView.selectedRow, makeIfNecessary: true) as! MYCellView
        print(selectedView.nameLabel.stringValue)
        
    }
    
    
    // 实现这个方法,可以支持滑动NSTableView Cell View的操作菜单(选项)
    func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableRowActionEdge) -> [NSTableViewRowAction] {
        
        if edge == .trailing {
            let rightAction = NSTableViewRowAction(style: .destructive, title: "Demo", handler: { (rowAction, row) in
                // 这里实现用户选中菜单后的事件处理
                
                print("点选了Dmeo")
            })
            
            rightAction.backgroundColor = NSColor.orange
            
            let rightAction1 = NSTableViewRowAction(style: .destructive, title: "Demo1", handler: { (rowAction, row) in
                // 这里实现用户选中菜单后的事件处理
                
                print("点选了Dmeo")
            })
            
            
            return [rightAction,rightAction1]
            
        }
        let leftAction = NSTableViewRowAction(style: .destructive, title: "LeftDemo", handler: { (rowAction, row) in
            // 这里实现用户选中菜单后的事件处理
            
            print("点选了Dmeo")
        })
        
        leftAction.backgroundColor = NSColor.orange

        return [leftAction]  // 空数组,表示不提供选项菜单(这里表示不支持左边滑动操作)
        
        
    }
    
    
    
    
}

