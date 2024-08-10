//
//  FirstLaunchView3.swift
//  ShapeShift
//
//  Created by Sanath Warad on 27/7/24.
//

import SwiftUI

struct FirstLaunchView3: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("ShapeShift1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("Congrats! You’re in!")
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    .padding(.top)
                    .foregroundStyle(Color.orange)
                Text("Welcome to Shapeshift!")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

#Preview {
    FirstLaunchView3()
}
