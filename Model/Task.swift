//
//  Task.swift
//  NC1
//
//  Created by 리 on 4/15/24.
//

//import SwiftUI
//
//struct Task: Identifiable{
//    var id = UUID().uuidString
//    var title: String
//    var time: Date = Date() //얘 나중에 지워야지
//}
//
////Total Task Meta View
//struct TaskMetaData: Identifiable{
//    var id = UUID().uuidString
//    var task: [Task]
//    var taskDate: Date
//}
//
////sample Date for Testing
//func getsampleDate(offset: Int)-> Date{
//    let calender = Calendar.current
//    
//    let date = calender.date(byAdding: .day, value: offset, to: Date())
//    
//    return date ?? Date()
//}
//
//var tasks: [TaskMetaData] = [
//    TaskMetaData(task: [
//    
//        Task(title: "밥 먹기")
//    ], taskDate: getsampleDate(offset: 0)),
//    
//]
