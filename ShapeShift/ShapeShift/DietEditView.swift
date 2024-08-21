//
//  DietEditView.swift
//  ShapeShift
//
//  Created by T Krobot on 21/8/24.
//

import SwiftUI

struct DietEditView: View {
    @State private var food = ""
    @State private var selection = ""
    let colors = ["Breakfast", "Lunch", "Dinner"]
    
    @State var shouldPresentSheet = false
    var body: some View {
        
        
        List{
            VStack{
                DietInputView(foodTitle: "Food", calorieTitle: "Calories", prompt: "Enter food here", caloriePrompt: "Input calories here")
                VStack(alignment: .leading) {
                    Picker("Select a meal:", selection: $selection) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .background(Rectangle().fill(Color.white))
                    
                    
                }
                .padding()
            }
            
        }
        
       
                    
    }
}



#Preview {
    DietEditView()
}

