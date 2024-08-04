//
//  MainView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 14/7/24.
//

import SwiftUI

struct MainView: View {
    let date = Date()
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hi there")
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
    MainView()
}
