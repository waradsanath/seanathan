import SwiftUI

struct SettingsView: View {
    @State private var gender: Gender = .male
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var neck: String = ""
    @State private var waist: String = ""
    @State private var bodyFatPercentage: Double?

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Gender")
                                .foregroundColor(.white)
                            Picker("Gender", selection: $gender) {
                                Text("Male").tag(Gender.male)
                                Text("Female").tag(Gender.female)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        
                        InputField(title: "Age", value: $age, unit: "years")
                        InputField(title: "Weight", value: $weight, unit: "kg")
                        InputField(title: "Height", value: $height, unit: "cm")
                        InputField(title: "Neck", value: $neck, unit: "cm")
                        InputField(title: "Waist", value: $waist, unit: "cm")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    if let bfp = bodyFatPercentage {
                        Text("Estimated fat percentage")
                            .foregroundColor(.white)
                        Text(String(format: "%.1f%%", bfp))
                            .font(.title)
                            .foregroundColor(.yellow)
                    }
                    
                    HStack(spacing: 20) {
                        Button(action: calculateBFP) {
                            Text("Calculate")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: clearFields) {
                            Text("Clear")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
    
    func calculateBFP() {
        // Implement BFP calculation here
        // This is a placeholder calculation
        bodyFatPercentage = 15.7
    }
    
    func clearFields() {
        age = ""
        weight = ""
        height = ""
        neck = ""
        waist = ""
        bodyFatPercentage = nil
    }
}

struct InputField: View {
    let title: String
    @Binding var value: String
    let unit: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            TextField("", text: $value)
                .keyboardType(.decimalPad)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(5)
            Text(unit)
                .foregroundColor(.white)
        }
    }
}

enum Gender {
    case male; case female
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
