//
//  ViewController1.swift
//  Demo
//
//  Created by Daredake on 2017/10/6.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class ViewController1: NSViewController {
//    var sunYang = [SunYang]()
    
    @IBOutlet weak var tableView: NSTableView!    // 中间的NSTabelView
    
    var sportManModel : SportModel? {
        didSet{
            tableView.reloadData()   // 刷新列表数据
        }
   
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        sunYang.append(SunYang(matchS: "里约奥运会400米自由泳", recordS: "3分41秒68"))
        // Do view setup here.
        
        
        // 监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Notification.Name("AddNewScore"), object: nil)
        
    }
    // 通知处理方法
    func handleNotification(_ notification : Notification) {
        // 1. 校验数据
        guard let model = notification.object as? ScoreModel else { return  }
        // 2. 添加到数组 : 这里要判断sportManModel第一次为nil的情况(根据你的应用需求)
        sportManModel?.scores.append(model)
        // 3. 刷新数据
        tableView.reloadData()
    }
    
}

extension ViewController1: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
//        return sunYang.count
        if let model = sportManModel {
            return model.scores.count
        }
        return 0
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let columnS = tableColumn {
            if let cellViewS = tableView.make(withIdentifier: columnS.identifier, owner: self) as? NSTableCellView {
                guard let model = sportManModel else { return nil }
                if columnS.identifier == "match" {
                    
                    cellViewS.textField?.stringValue = model.scores[row].matchP
                    return cellViewS
                }
                if columnS.identifier == "record" {
                   cellViewS.textField?.stringValue = model.scores[row].recordP
                    return cellViewS
                }
                return cellViewS
            }
        }
        return nil
    }
}
