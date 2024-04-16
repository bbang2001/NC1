//
//  Start.swift
//  NC1
//
//  Created by 리 on 4/13/24.
//

import SwiftUI

struct DateSelectionView: View {
    @Binding var selectedDate: Date
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            
            Button(action: {
                UserDefaults.standard.set(self.selectedDate, forKey: "selectedDate")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("확인")
            }
        }
        .padding()
    }
}



