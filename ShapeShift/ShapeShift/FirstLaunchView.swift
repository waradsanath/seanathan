//
//  FirstLaunchView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 14/7/24.
//

import SwiftUI

struct FirstLaunchView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("ShapeShift1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("Welcome to ShapeShift!")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
                    .padding(.top)
                    .foregroundStyle(Color.orange)
                Text("An encouraging and affirming app for you to keep your weight in check!")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    FirstLaunchView()
}
