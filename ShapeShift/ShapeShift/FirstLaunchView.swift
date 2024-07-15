//
//  FirstLaunchView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 14/7/24.
//

import SwiftUI

struct FirstLaunchView: View {
    @State var yWelcome = 350.0
    @State var page = 1
    @State var yImage = 700.0
    @State var yText2 = 700.0
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to ShapeShift!")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .frame(alignment: .center)
                    .position(x: 186, y: yWelcome)
                    .animation(.easeInOut(duration: 1), value: yWelcome)
                Image("PersonSitting")
                    .position(x: 186, y: yImage)
                    .animation(.easeInOut(duration: 1), value: yImage)
                Text("But first, lets enter your details")
                    .font(.title)
                    .position(x: 165, y: yText2)
                    .animation(.easeInOut(duration: 1), value: yText2)
                    .frame(width: 341, height:200)
                    .multilineTextAlignment(.center)
                    
                Button {
                    if page == 1 {
                        yWelcome -= 300
                        yImage -= 700
                        yText2 -= 750
                        page += 1

                    }
                } label: {
                    Text("Move")
                }
            }
            .padding()
        }
        .navigationTitle("First Launch")
    }
}

#Preview {
    FirstLaunchView()
}
