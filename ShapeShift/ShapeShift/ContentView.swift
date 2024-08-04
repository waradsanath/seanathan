//
//  ContentView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isFirstLaunch: Bool
    
    init() {
        let firstLaunchKey = "hasLaunchedBefore"
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: firstLaunchKey)
        
        _isFirstLaunch = State(initialValue: !hasLaunchedBefore)
        
        if !hasLaunchedBefore {
            UserDefaults.standard.set(true, forKey: firstLaunchKey)
        }
        
    }
    
    var body: some View {
        if isFirstLaunch {
            FirstLaunchTabView()
        } else {
            MainView()
        }
    }
}

#Preview {
    ContentView()
}
