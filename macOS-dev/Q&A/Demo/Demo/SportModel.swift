//
//  SportModel.swift
//  Demo
//
//  Created by Alexcai on 2017/10/6.
//  Copyright © 2017年 Daredake. All rights reserved.
//

import Cocoa

class SportModel: NSObject {

    var nameP = ""           // 运动员姓名
    
    var scores: [ScoreModel] = []  // 成绩

    init(_ name : String, match: String, recode : String) {
        nameP = name
        scores = [ScoreModel(match, record:recode)]
    }
}
