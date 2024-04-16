//
//  MenuCell.swift
//  NC1
//
//  Created by 리 on 4/16/24.
//

import SwiftUI

//입력된 거 보여주는 '오늘의 기록'
struct Menucell: View {
    let menu: TodayRecords
    
    var body: some View {
        Text(menu.menu1)
        Text(menu.menu2)
        Text(menu.menu3)
        Text(menu.condition1)
        Text(menu.condition2)
        Text(menu.study)
        Text(menu.studytime)
        Text(menu.exercise)
        Text(menu.exercisetime)
        
    }
}



