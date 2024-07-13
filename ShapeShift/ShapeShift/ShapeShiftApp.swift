//
//  ShapeShiftApp.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import SwiftUI

@main
struct ShapeShiftApp: App {
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.orange)
                .preferredColorScheme(isDarkMode ? .dark: .light)
        }
    }
}
