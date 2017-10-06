//
//  ScoreModel.swift
//  Demo
//
//  Created by Alexcai on 2017/10/6.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class ScoreModel: NSObject {
    var matchP = ""         // 参与赛事
    var recordP = ""        // 成绩记录
    
    init(_ match : String , record : String) {
        matchP = match
        recordP = record
    }
}
