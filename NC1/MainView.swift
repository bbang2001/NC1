//
//  SwiftUIView.swift
//  NC1
//
//  Created by 리 on 4/11/24.
//

import SwiftUI


//struct 붕어빵틀 {
//    let 재료: String
//    let 굽기: String
//}

struct MainView: View {
    
    @State private var selectedDate: Date = UserDefaults.standard.object(forKey: "selectedDate") as? Date ?? Date()
    @State private var showDateSelection = false
    
    
    let dateformat01: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()   //오늘 날짜
    
    
    var body: some View {
        
        VStack {
            HStack{
                VStack{
                    Text("\(Date(), formatter:dateformat01)")
                        .bold()
                        .font(.system(size: 28)) //현재날짜
                    
                    HStack{
                        
                        Text("쿵집사와 함께한 지 \(daysSinceSelectedDate())일째")
                            .font(.system(size:18))
                            .padding(.leading)
                        
                        Button(action: {
                            self.showDateSelection.toggle()
                        }) {
                            Image(systemName: "gearshape")
                        }
                        
                    }
                }
                
                Spacer()
                NavigationLink {
                  //  CustomDatePicker(currentDate: $selectedDate)
                    CustomDatePicker()
//                    let 슈크림붕어빵 = 붕어빵틀(재료: "팥", 굽기: "미디엄")
                } label: {
                    Image(systemName: "calendar")
                        .font(.system(size: 40))
                        .padding(.trailing)    //캘린더기호
                        .foregroundStyle(.black)
                }

                
            }
            Spacer()
                .frame(width:500, height: 120)
            
            
            Image("말풍선1")
                .resizable()
                .scaledToFit()
                .frame(width:250)
            
            
            Image("쿵야")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
         /*   Button(action: {}) {
                
                ZStack{
                    Rectangle()
                        .fill(Color.mycolor)
                        .frame(width: 500, height: 150)
                    
                    Text("오늘의 하루를 알려주세요!")
                        .font(.title)
                        .tint(.black)
                }
            } */
        }
        .sheet(isPresented: $showDateSelection) {
            DateSelectionView(selectedDate: self.$selectedDate)
            
            
        }
        
    }
    
    
    
    func daysSinceSelectedDate() -> Int {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        let selectedDateStartOfDay = calendar.startOfDay(for: selectedDate)
        let components = calendar.dateComponents([.day], from: selectedDateStartOfDay, to: currentDate)
        return components.day ?? 0
    }
    
}







#Preview {
    MainView()
}


