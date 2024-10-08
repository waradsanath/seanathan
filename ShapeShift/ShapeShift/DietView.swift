import SwiftUI

var kcals: Double = 1900
var dailyKcalIntake: Double = 1500

var percentage: Double {
    (kcals / dailyKcalIntake) * 100
}

var overLimit: Bool = false

var progressBarWidth: CGFloat {
    let percentage = (kcals / dailyKcalIntake) * 100
    let maxWidth: CGFloat = UIScreen.main.bounds.width - 32 // Adjust to fit your design
    return maxWidth * CGFloat(min(percentage, 100)) / 100
}



struct dietMeal {
    @Binding var foodName: String
    @Binding var foodDescription: String
    @Binding var meal: String
    @Binding var caloricCount: Int
}

struct DietView: View {
    
    
    @State private var editing: Bool = false
    @State private var showingAlert = false
    @State private var newListItem = " "
    
    @State var shouldPresentSheet = false
    
    @State private var meals: [dietMeal] = []
    
    let DietMeal = dietMeal(foodName: .constant(""), foodDescription: .constant(""), meal: .constant(""), caloricCount: .constant(10))
    
    var body: some View {
        NavigationStack {
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(){
                    Text("Limit")
                    
                        .bold()
                        .font(.system(size: 30))
                    
                    
                    Spacer()
                    
                    Text(String(floor(percentage)) + "% of " + String(dailyKcalIntake))
                        .foregroundColor(percentage > 100 ? .red : .gray)
                    
                }
                
                ZStack(alignment: .leading) {
                    // Background of progress bar
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    
                    // Foreground of progress bar
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.red)
                        .frame(width: progressBarWidth, height: 20)
                    
                    
                }
                
                
            }
            .padding()
            
            HStack {
                Text("Meals")
                
                    .bold()
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    .padding()
                
                Spacer()
                
                
                
                if editing == false {
                    Button {
                        editing.toggle()
                    } label: {
                        Text("Edit")
                        
                            .padding()
                            .font(.system(size: 21))
                    }
                    
                } else {
                    Button {
                        editing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                            .font(.system(size: 21))
                    }
                }
                
            }
            

            
            Button("Add Meal") {
                shouldPresentSheet.toggle()
            } .sheet(isPresented: $shouldPresentSheet, onDismiss: didDismiss) {
                DietEditView()
                Button("Done") {
                    meals.append(DietMeal)
                    
                    
                    shouldPresentSheet.toggle()
                    
                }
                .buttonStyle(.borderedProminent)
            }	
            
            List(meals, id: \.foodName) { meal in
                           DietMealView(
                            foodName: DietMeal.foodName,
                               foodDescription: DietMeal.foodDescription,
                               meal: DietMeal.meal,
                               caloricCount: Int(DietMeal.caloricCount)
                           )
                       }
            
            
            .navigationTitle("Diet")
        }
        
    }
    func didDismiss() {
        
    }
}











//   var numberOfLayers: Int {
//     return Int(floor(percentage / 100))
//   }







// func progressBar() {
//     let percentage = (kcals / dailyKcalIntake) * 100
//  var numberOfLayers: Int {
//      Int(floor(percentage / 100))
//  }
//
//  if percentage.truncatingRemainder(dividingBy: 100) == 0 {
//        var newBarpercentage = Int(percentage) - (Int(numberOfLayers) * 100)
//      layerNumber.append(numberOfLayers)
//  }

// }

#Preview {
    DietView()
}




























