//
//  TabMainView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 12/8/24.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            MainView(activity: Activity(id: 0, count: "", goal: 1))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .environmentObject(HealthManager())
            DietView()
                .tabItem {
                    Label("Diet", systemImage: "fork.knife")
                }
                .environmentObject(HealthManager())
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .environmentObject(HealthManager())
        }
    }
}

#Preview {
    TabMainView()
        .environmentObject(HealthManager())
}
