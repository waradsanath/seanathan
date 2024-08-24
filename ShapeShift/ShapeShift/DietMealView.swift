
import SwiftUI

struct DietMealView: View {
    
    var foodName: String
    var foodDescription: String
    var meal: String
    var caloricCount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(foodName)
                    .font(.headline)
                    
                Text(foodDescription)
                    .font(.subheadline)
                    
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(String(caloricCount))
                    .font(.headline)
                    
                Text(meal)
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
        }
        .padding()
        
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    DietMealView(foodName: "Skbidi Slicers", foodDescription: "make from skibid and slice em up", meal: "Lunch", caloricCount: 0)
}
