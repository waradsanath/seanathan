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
            MainView(activity: Activity(id: 0, count: 1, goal: 1))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            DietView(food: .constant(""), caloricValue: .constant(0))
                .tabItem {
                    Label("Diet", systemImage: "fork.knife")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    TabMainView()
}
