//
//  MainView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 14/7/24.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let amount: String
}

struct MainView: View {
    let date = Date()
    @EnvironmentObject var manager: HealthManager
    @AppStorage("isDarkMode") var isDarkMode = false
    @State var activity: Activity
    
    var body: some View {
        NavigationStack {
            VStack {
                
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
    }
    var formattedDate: String {
        DateFormatter.custom.string(from: date)
    }
}



#Preview {
    MainView(activity: Activity(id: 0, title: "", subtitle: <#T##String#>, image: <#T##String#>, amount: <#T##String#>))
}
