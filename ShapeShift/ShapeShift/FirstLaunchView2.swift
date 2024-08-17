//
//  FirstLaunchView2.swift
//  ShapeShift
//
//  Created by Sanath Warad on 27/7/24.
//

import SwiftUI

struct FirstLaunchView2: View {
    @AppStorage("weight") var weight: String = ""
    @AppStorage("height") var height: String = ""
    @AppStorage("neck") var neck: String = ""
    @AppStorage("waist") var waist: String = ""
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
                        InputView(text: $height, title: "Height", unit: "cm")
                            .padding(.leading)
                        InputView(text: $weight, title: "Weight", unit: "kg")
                            .padding(.trailing)
                    }
                    HStack {
                        InputView(text: $neck, title: "Neck Circumference", unit: "cm")
                            .padding(.leading)
                        InputView(text: $waist, title: "Waist Circumference", unit: "cm")
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
