//
//  FirstLaunchTabView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 27/7/24.
//

import SwiftUI

struct FirstLaunchTabView: View {
    var body: some View {
        TabView {
            FirstLaunchView()
            FirstLaunchView1()
            FirstLaunchView2()
            FirstLaunchView3()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    FirstLaunchTabView()
}
