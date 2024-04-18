//
//  ContentView.swift
//  NC1
//
//  Created by 리 on 4/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var showAddSheet = false
    
    @Query(sort: \TodayRecords.menu1) var TodayRecordsList: [TodayRecords]
//    @State private var MenuToUpdate : TodayRecords?
    
    var body: some View {
        
        NavigationStack{
            
            
            VStack {
                
                MainView()
                
                
                Spacer()
                    .frame(height:50)
                
                
                
                Button(action: {
                    self.showAddSheet.toggle()
                }) {
                    Image("업로드버튼")
                }
                
            }
            .sheet(isPresented: $showAddSheet) {AddMenu()}
//            .sheet(item: $MenuToUpdate) { menu in
//                UpdateMenu(menu: menu)
                
//            }
            
            
        }
        
    }
    
}





//입력 창






//수정기능
//struct UpdateMenu: View {
//    @Environment(\.dismiss) private var dismiss
//    @Bindable var menu: TodayRecords //바인더블은 뭐지
//    
//    var body: some View {
//        NavigationStack{
//            Form{
//                TextField("아침", text: $menu.menu1)
//                TextField("점심", text: $menu.menu2)
//                TextField("저녁", text: $menu.menu3)
//                TextField("몸", text: $menu.condition1)
//                TextField("기분", text: $menu.condition2)
//                TextField("공부", text: $menu.study)
//                TextField("공부시간", text: $menu.studytime)
//                TextField("운동", text: $menu.exercise)
//                TextField("운동시간", text: $menu.exercisetime)
//            }
//            .navigationTitle("Update Menu")
//            .navigationBarTitleDisplayMode(.large)
//            .toolbar{
//                ToolbarItemGroup(placement: .topBarTrailing){
//                    Button("업데이트") {
//                        dismiss()
//                    }
//                }
//            }
//        }
//    }
//}



