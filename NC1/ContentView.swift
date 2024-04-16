//
//  ContentView.swift
//  NC1
//
//  Created by 리 on 4/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // @Environment(\.modelContext) var context
    @State private var showAddSheet = false
    
    @Query(sort: \TodayRecords.menu1) var TodayRecordsList: [TodayRecords]
    //   @State private var MenuToUpdate : Menu?
    
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
            //    .sheet(item: $MenuToUpdate) { menu in
            //        UpdateMenu(menu: menu)
            
            //  }
            
            
        }
        
    }
    
}





//입력 창
struct AddMenu: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var menu1: String = ""
    @State private var menu2: String = ""
    @State private var menu3: String = ""
    @State private var condition1: String = ""
    @State private var condition2: String = ""
    @State private var study: String = ""
    @State private var studytime: String = ""
    @State private var exercise: String = ""
    @State private var exercisetime: String = ""
    
    
    let dateformat01: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()   //오늘 날짜 -> 얘를 여기서도 선언해줘야하나???
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("밥")
                        .font(.system(size:25))
                        .bold()
                        .foregroundStyle(.black), content: {
                            
                            HStack(content: {
                                Text("아침:")
                                TextField("", text: $menu1)
                            })
                            
                            HStack(content: {
                                Text("점심:")
                                TextField("", text: $menu2)
                            })
                            HStack(content: {
                                Text("저녁:")
                                TextField("", text: $menu3)
                            })
                            
                        })
                    
                    Section(header: Text("컨디션")
                        .font(.system(size:25))
                        .bold()
                        .foregroundStyle(.black), content: {
                            
                            HStack(content: {
                                Text("몸:")
                                TextField("", text: $condition1)
                            })
                            
                            HStack(content: {
                                Text("기분:")
                                TextField("", text: $condition2)
                            })
                            
                        })
                    
                    Section(header: Text("공부")
                        .font(.system(size:25))
                        .bold()
                        .foregroundStyle(.black), content: {
                            
                            HStack(content: {
                                Text("공부:")
                                TextField("", text: $study)
                                
                                TextField("공부시간", text: $studytime)
                            })
                            
                        })
                    
                    Section(header: Text("운동")
                        .font(.system(size:25))
                        .bold()
                        .foregroundStyle(.black), content: {
                            
                            HStack(content: {
                                Text("운동:")
                                TextField("", text: $exercise)
                                
                                TextField("운동시간", text: $exercisetime)
                            })
                            
                        })
                    
                    
                    
                    
                }
                Button("오늘의 하루 보고하기"){
                    let menu = TodayRecords(menu1: menu1, menu2: menu2, menu3: menu3, condition1: condition1, condition2: condition2, study: study, studytime: studytime, exercise: exercise, exercisetime: exercisetime, today: Date())
                    
                    
                    context.insert(menu)
                    let _: ()? = try? context.save()
                    dismiss()
                    
                }
                .padding()
                .frame(width:320, height: 70)
                .background(.green)
                .cornerRadius(13)
                .font(.system(size:25))
                .bold()
                .foregroundColor(.white)
            }
            .navigationTitle("\(Date(), formatter:dateformat01)")
            .navigationBarTitleDisplayMode(.large)
            
            
        }
    }
    
    
    
}

struct UpdateMenu: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var menu: TodayRecords //바인더블은 뭐지
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("아침", text: $menu.menu1)
                TextField("점심", text: $menu.menu2)
                TextField("저녁", text: $menu.menu3)
                TextField("몸", text: $menu.condition1)
                TextField("기분", text: $menu.condition2)
                TextField("공부", text: $menu.study)
                TextField("공부시간", text: $menu.studytime)
                TextField("운동", text: $menu.exercise)
                TextField("운동시간", text: $menu.exercisetime)
            }
            .navigationTitle("Update Menu")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("업데이트") {
                        dismiss()
                    }
                }
            }
        }
    }
}



