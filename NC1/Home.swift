//
//  Home.swift
//  NC1
//
//  Created by 리 on 4/15/24.
//

import SwiftUI


struct Home: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20){
                
            //    CustomDatePicker(currentDate: $currentDate)
                CustomDatePicker(currentDate: currentDate)
            }
            .padding(.vertical)
        }
    }
}

struct Home_Previews: PreviewProvider{
    static var previews: some View {
       Home()
    }
}
