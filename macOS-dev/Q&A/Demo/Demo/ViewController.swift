//
//  ViewController.swift
//  Demo
//
//  Created by Daredake on 2017/10/5.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var datas = [Name]()

    // 数据模型数组
    var sportData : [SportModel] = []
    
    
    @IBOutlet weak var nameTable: NSScrollView!
    @IBOutlet weak var containerView: NSView!
    var v1: ViewController1?
//    var v2: NSViewController?
//    var currentVC: NSViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建数据模型示例
        let sportSun = SportModel("孙杨", match: "里约奥运会400米自由泳", recode: "3分41秒68")
        let sportPhelps = SportModel("菲尔普斯", match: "2009年罗马世锦赛100米蝶泳", recode: "49秒82")
        let sportSp = SportModel("孙普", match: "世锦赛XXX米", recode: "a分b秒")
        sportData = [sportSun,sportPhelps,sportSp]
        

        
//        datas.append(Name(name: "孙杨"))
//        datas.append(Name(name: "菲尔普斯"))

        
        
        
        
        
//        let storyboard = NSStoryboard(name: "Main", bundle: nil)
//        v1 = storyboard?.instantiateController(withIdentifier: "v1") as? ViewController1
//        v2 = storyboard.instantiateController(withIdentifier: "v2") as? NSViewController


        // Do any additional setup after loading the view.
    }

//    func showController(_ vc: NSViewController) {
//        if currentVC != nil {
//            currentVC?.view.removeFromSuperview()
//            currentVC?.removeFromParentViewController()
//        }
//        addChildViewController(vc)
//        vc.view.frame = containerView.bounds
//        containerView.addSubview(vc.view)
//        currentVC = vc
//    }



    // Container View 从Storyboard 中第一次加载NSController View时,调用此方法
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        // 初始化v1
        v1 = segue.destinationController as? ViewController1
        // 调用父类方法
        super.prepare(for: segue, sender: sender)
    }
}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
//        return datas.count
        return sportData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let column = tableColumn {
            if let cellView = tableView.make(withIdentifier: column.identifier, owner: self) as? NSTableCellView {
                if column.identifier == "name" {
                    let model = sportData[row]
                    cellView.textField?.stringValue = model.nameP
//                    cellView.textField?.stringValue = "\(datas[row].name)"
                    return cellView
                }
                return cellView
            }
        }
        return nil
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        let tableView = notification.object as! NSTableView
        let row = tableView.selectedRow

        v1?.sportManModel = sportData[row]

//        switch row {
//        case 1:
//            showController(v2!)
//        default:
//            showController(v1!)
//        }
    }

}
