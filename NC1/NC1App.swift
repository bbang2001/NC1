//
//  NC1App.swift
//  NC1
//
//  Created by 리 on 4/11/24.
//

import SwiftUI
import SwiftData

@main
struct  SwiftDataExampleAppApp : App {
    var body: some  Scene {
        WindowGroup {
            ContentView ()
        }
        .modelContainer(for: TodayRecords . self )
    }
}
