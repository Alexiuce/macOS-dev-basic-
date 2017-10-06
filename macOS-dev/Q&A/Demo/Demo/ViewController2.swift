//
//  ViewController2.swift
//  Demo
//
//  Created by Daredake on 2017/10/6.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class ViewController2: NSViewController {
    var phelps = [Phelps]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        phelps.append(Phelps(matchP: "2009年罗马世锦赛100米蝶泳", recordP: "49秒82"))
        // Do view setup here.
    }

}

extension ViewController2: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return phelps.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let columnP = tableColumn {
            if let cellViewP = tableView.make(withIdentifier: columnP.identifier, owner: self) as? NSTableCellView {
                if columnP.identifier == "match" {
                    cellViewP.textField?.stringValue = "\(phelps[row].matchP)"
                    return cellViewP
                }
                if columnP.identifier == "record" {
                    cellViewP.textField?.stringValue = "\(phelps[row].recordP)"
                    return cellViewP
                }
                return cellViewP
            }
        }
        return nil
    }
}
