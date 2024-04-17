//
//  AddMenu.swift
//  NC1
//
//  Created by 리 on 4/17/24.
//

import SwiftUI
import SwiftData


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
