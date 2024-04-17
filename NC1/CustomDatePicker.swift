//
//  SwiftUIView.swift
//  NC1
//
//  Created by 리 on 4/15/24.
//

import SwiftUI
import SwiftData

struct CustomDatePicker: View {
    @State var currentDate : Date = Date()
    
    //Month update on arrow button clicks-
    @State var currentMonth: Int = 0
    @Environment(\.modelContext) var context
    @Query(sort: \TodayRecords.menu1) var MenuList: [TodayRecords]
    
    var body: some View {
        
        
        
        VStack(spacing: 20){

            
            
            let days: [String] =
            ["일","월","화","수","목","금","토"]
            
            
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraData()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraData()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button{
                    
                    withAnimation{
                        currentMonth -= 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .tint(.green)
                } //달력버튼
                
                Button{
                    
                    withAnimation{
                        currentMonth += 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .tint(.green)
                } //달력버튼
                
            }
            .padding(.horizontal)
            //Day View
            
            HStack(spacing:0){
                ForEach(days,id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    
                }
            } //요일
            
            //Dates..
            //Lazy Grid..
            let columns = Array(repeating: GridItem(.flexible()),count: 7) //정렬

            
            LazyVGrid(columns: columns, spacing: 10) {
                
                ForEach(extractDate()){value in
                    
                    CardView(value: value)
                        .background(
                            
                            Capsule()
                                .fill(Color(.green))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            
  
                            
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            
            StoredDateView(currentDate: $currentDate)
            
        }
        .onChange(of: currentMonth) { oldvalue,newValue in
            // updating Month ...
            currentDate = getCurrentMonth()
        }
        
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View {
        
        VStack {
            if value.day != -1{    //마이너스 없애줌
                if let records = MenuList.first(where: { records in
                    
                    return isSameDay(date1: records.today, date2: value.date)
                }){
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: records.today, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    
                    ForEach(MenuList) { record in
                        if isSameDay(date1: value.date, date2: record.today){
                            Circle()    //도장
                                .fill(isSameDay(date1: record.today, date2: currentDate ) ? .white :Color(.green))
                                
                                    .frame(width: 8, height: 8)
                                
                        }
                    }
            
                }
                else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical,8)
        .frame(height: 60, alignment: .top)
        
    }
    
    
    // checking dates
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    
    
    //Extrating Year and Month for display
    func extraData()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    
    func getCurrentMonth()-> Date{
        
        let calendar = Calendar.current
        
        //Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    
    
    
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        
        //Getting Current Month Date
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //getting day
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
            
        }
        
        //adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at:0)
        }
        return days
        
    }
    
}

#Preview {
    Content2View()
}








// extending date to get current month dates...
extension Date{
    
    func getAllDates()->[Date]{
        let calendar = Calendar.current
        
        //getting start date -> 얘 안해주면 날짜배열 이상해짐
        let startDate = calendar.date(from:
                                        Calendar.current.dateComponents([.year,.month], from:self))!
        
        
        
        let range = calendar.range(of: .day, in:.month, for: startDate)!
        
        
        //getting date
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to:startDate)!
            
            // ㄴ>To self에서 스타트데이로 바꿔줌
            
        }
    }
}
