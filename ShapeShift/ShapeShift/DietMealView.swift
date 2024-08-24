
import SwiftUI

struct DietMealView: View {
    
    var food: String
    var foodDescription: String
    var meal: String
    var caloricCount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food)
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
        .background(Color.gray.opacity(0.4))
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    DietMealView(food: "Skbidi Slicers", foodDescription: "make from skibid and slice em up", meal: "Lunch", caloricCount: 0)
}
