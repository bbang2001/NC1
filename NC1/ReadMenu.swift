//
//  MenuCell.swift
//  NC1
//
//  Created by 리 on 4/16/24.
//

import SwiftUI
import SwiftData

//입력된 거 보여주는
struct ReadMenu: View {
    let menu: TodayRecords

    var body: some View {
        
        ScrollView{
            
            
            VStack(alignment: .leading, spacing: 10) {
            
                Section(header: Text("밥")
                    .font(.system(size:25))
                    .bold()
                    .foregroundStyle(.black), content: {
                        
                            Text("  아침: \(menu.menu1)")
                            .frame(width: 300, height: 35, alignment: .leading)
                            .border(Color.gray)
                            
                            Text("  점심: \(menu.menu2)")
                            .frame(width: 300, height: 35, alignment: .leading)
                            .border(Color.gray)
                            Text("  저녁: \(menu.menu3)")
                            .frame(width: 300, height: 35, alignment: .leading)
                            .border(Color.gray)
                        


                    })
                
                Spacer()
                    .frame(height:10)
                
                Section(header: Text("컨디션")
                    .font(.system(size:25))
                    .bold()
                    .foregroundStyle(.black), content: {
                    
                            Text("  몸: \(menu.condition1)")
                            .frame(width: 300, height: 35, alignment: .leading)
                            .border(Color.gray)
                            Text("  기분: \(menu.condition2)")
                            .frame(width: 300, height: 35, alignment: .leading)
                            .border(Color.gray)
                        
                    })
                
                Spacer()
                    .frame(height:10)
                
                Section(header: Text("공부")
                    .font(.system(size:25))
                    .bold()
                    .foregroundStyle(.black), content: {
                        
                        HStack(content: {
                            Text(" 과목: \(menu.study)")
                                .frame(width: 200, height: 35, alignment: .leading)
                                .border(Color.gray)
                            
                            Text(menu.studytime)
                                .frame(width: 93, height: 35, alignment: .center)
                                .border(Color.gray)
                            
                        })
                        
                    })
                
                Spacer()
                    .frame(height:10)
                
                
                Section(header: Text("운동")
                    .font(.system(size:25))
                    .bold()
                    .foregroundStyle(.black), content: {
                        
                        HStack(content: {
                            Text("  종목: \(menu.exercise)")
                                .frame(width: 200, height: 35, alignment: .leading)
                                .border(Color.gray)
                                
                            Text(menu.exercisetime)
                                .frame(width: 93, height: 35, alignment: .center)
                                .border(Color.gray)
                            
                        })
                        
                    })

            }
            
        }
    }
}

