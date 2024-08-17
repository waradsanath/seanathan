//
//  ShapeShiftApp.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import SwiftUI

@main
struct ShapeShiftApp: App {
    @StateObject var healthManager = HealthManager()
    @AppStorage("isDarkMode") var isDarkMode = false
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark: .light)
                .tint(Color.orange)
                .environmentObject(healthManager)
        }
    }
}
