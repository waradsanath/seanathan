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
                Button {
                    if page == 1 {
                        yWelcome -= 300
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
