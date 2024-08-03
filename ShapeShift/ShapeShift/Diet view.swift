import SwiftUI

struct DietView: View {
    var kcals: Double = 1000
    var dailyKcalIntake: Double = 1500
    


    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack(alignment: .leading) {
                        
                        HStack(){
                            Text("Limit")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 30))
                                .padding()
                            
                            Spacer()
                            
                            Text(String(floor(percentage)) + "% of " + String(dailyKcalIntake))
                                .foregroundColor(percentage > 100 ? .red : .gray)
                                .padding()
                                
                            
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
                            
                            ForEach(0..<numberOfLayers, id: \.self) { index in
                                Rectangle()
                                    .fill(index == 0 ? Color.red : index == 1 ? Color.yellow : Color.green)
                                    .frame(width: progressBarWidth - 100, height: 30)
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
                        
                        NavigationStack {
                            // Navigation content
                        }
                    }
                }
                .navigationTitle("Diet")
            }
            var percentage: Double {
                (kcals/dailyKcalIntake) * 100
            }
            
            var numberOfLayers: Int {
                return Int(floor(percentage / 100))
            }
        }
    }
    
    var progressBarWidth: CGFloat {
        let percentage = (kcals / dailyKcalIntake) * 100
        let maxWidth: CGFloat = UIScreen.main.bounds.width - 32 // Adjust to fit your design
        return maxWidth * CGFloat(percentage) / 100
    }
}

#Preview {
    DietView()
}


