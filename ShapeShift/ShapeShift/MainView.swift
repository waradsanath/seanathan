//
//  MainView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 14/7/24.
//

import SwiftUI

struct Activity {
    let id: Int
    let count: String
    let goal: Int
}

struct MainView: View {
    let date = Date()
    @EnvironmentObject var manager: HealthManager
    @AppStorage("isDarkMode") var isDarkMode = false
    let activity: Activity
    
    var body: some View {
        NavigationStack {
            VStack {
                ProgressBar(totalWidth: 370, percentage: Double(activity.count) ?? 0, colorBackground: Color.gray, colorForeground: Color.green)
                    .padding(.horizontal)
            }
            .navigationTitle(formattedDate)
            .toolbar {
                Button {
                    isDarkMode.toggle()
                } label: {
                    isDarkMode ? Image(systemName: "moon.stars") : Image(systemName: "sun.max")
                }
            }
        }
        .onAppear {
            manager.fetchTodaySteps()
        }
    }
    var formattedDate: String {
        DateFormatter.custom.string(from: date)
    }
}



#Preview {
    MainView(activity: Activity(id: 0, count: "1", goal: 1))
        .environmentObject(HealthManager())
}
