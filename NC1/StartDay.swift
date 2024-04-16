//
//  StartDay.swift
//  NC1
//
//  Created by 리 on 4/12/24.
//

import SwiftUI

struct StartDay: View {
    
    
    @Binding var selectedDate: Date
    
    
    
    
    var body: some View {
        

    
        DatePicker("디데이 날짜", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(.compact).labelsHidden()
        
        
        
           
            
            
        }
        
    }
    
    
    
    


#Preview {
    StartDay()
}
