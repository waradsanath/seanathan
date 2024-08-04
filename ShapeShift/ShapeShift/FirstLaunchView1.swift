//
//  FirstLaunchView1.swift
//  ShapeShift
//
//  Created by Sanath Warad on 27/7/24.
//

import SwiftUI

struct FirstLaunchView1: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("ShapeShift1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("First, let's enter your biometrics")
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    .padding(.top)
                    .foregroundStyle(Color.orange)
                Text("This will help Shapeshift recommend personalised exercises for you!")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    FirstLaunchView1()
}
