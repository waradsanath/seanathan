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





struct DietView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack(){
                            Text("Limit")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 30))
                            
                            
                            Spacer()
                            
                            Text(String(floor(percentage)) + "% of " + String(dailyKcalIntake))
                                .foregroundColor(percentage > 100 ? .red : .gray)
                            
                        }
                        
                        ZStack(alignment: .leading) {
                            // Background of progress bar
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 20)
                                .cornerRadius(100)
                            
                            // Foreground of progress bar
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: progressBarWidth, height: 20)
                                .cornerRadius(100)
                            
                            
                        }
                        
                        
                    }
                    .padding()
                    
                    HStack {
                        Text("Meals")
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 30))
                            .padding()
                        
                        Spacer()
                        Button {
                            // Action for edit button
                        } label: {
                            Text("Edit")
                                .padding()
                                .font(.system(size: 21))
                        }
                    }
                    NavigationLink(destination: RunningView()) {
                        WorkoutItemView(title: "Running", description: "Exercise info, naggy sus mogijvisdjvs")
                    }
                    
                    NavigationStack {
                        // Navigation content
                    }
                }
            }
            .navigationTitle("Diet")
        }
        
        
     //   var numberOfLayers: Int {
       //     return Int(floor(percentage / 100))
     //   }
    }
}





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




























