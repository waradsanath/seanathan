//
//  ContentView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import SwiftUI

struct ContentView: View {
    let date = Date()
    @AppStorage("isDarkMode") var isDarkMode = false
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    var body: some View {
        NavigationStack {
            Text("")
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
    ContentView()
}
