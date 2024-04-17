//
//  StoredData.swift
//  NC1
//
//  Created by 리 on 4/16/24.
//

import SwiftUI
import SwiftData
//추가한

struct StoredDateView: View {
    @Binding var currentDate: Date
    @Environment(\.modelContext) var context
    @Query(sort: \TodayRecords.menu1) var MenuList: [TodayRecords]
    
    var body: some View{
        
                ForEach(MenuList) { record in
                    if isSameDay(date1: currentDate, date2: record.today){  //현재 클릭한 날짜랑, 등록한 날짜랑
                        ReadMenu(menu: record)
                            
                    }
                }
        
    }
    
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}
