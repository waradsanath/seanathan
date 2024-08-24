//
//  DietInputView.swift
//  ShapeShift
//
//  Created by T Krobot on 21/8/24.
//






import SwiftUI

struct DietInputView: View {
    
    @State var food: String = ""
    @State var caloricValue: String = ""
    
    
    var foodTitle: String
    var calorieTitle: String
    var prompt: String
    var caloriePrompt: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(foodTitle)
                .foregroundColor(.black)
            TextField(prompt, text: $food)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
        
        
        
     
            Text(calorieTitle)
                .foregroundColor(.black)
            TextField(prompt, text: $caloricValue)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
        }
        .padding()
      
    }
    
}

#Preview {
    DietInputView(foodTitle: "Food", calorieTitle: "Calories", prompt: "Enter food here", caloriePrompt: "Enter calories here")
}
