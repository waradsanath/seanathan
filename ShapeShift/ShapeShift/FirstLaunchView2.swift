//
//  FirstLaunchView2.swift
//  ShapeShift
//
//  Created by Sanath Warad on 27/7/24.
//

import SwiftUI

struct FirstLaunchView2: View {
    @AppStorage("Height") var height = ""
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
                VStack {
                    HStack {
                        InputView(title: "Height", unit: "cm")
                            .padding(.leading)
                        InputView(title: "Weight", unit: "kg")
                            .padding(.trailing)
                    }
                    HStack {
                        InputView(title: "Neck Circumference", unit: "cm")
                            .padding(.leading)
                        InputView(title: "Waist Circumference", unit: "cm")
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

#Preview {
    FirstLaunchView2()
}
