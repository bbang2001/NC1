//
//  Item.swift
//  NC1
//
//  Created by 리 on 4/11/24.
//

import Foundation
import SwiftData

@Model
class  TodayRecords {
    var menu1: String
    var menu2: String
    var menu3: String
    var condition1: String
    var condition2: String
    var study: String?
    var studytime: String?
    var exercise: String?
    var exercisetime: String?
    var today: Date
    
    init ( menu1 : String , menu2 : String, menu3: String, condition1: String, condition2: String) {
        self.menu1 = menu1
        self.menu2 = menu2
        self.menu3 = menu3
        self.condition1 = condition1
        self.condition2 = condition2
        
        self.today = Date()
    }
}

