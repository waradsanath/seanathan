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
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            DietView()
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
