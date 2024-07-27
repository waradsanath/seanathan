import SwiftUI

struct SettingsView: View {
    @State private var name: String = ""
    @State private var gender: Gender = .male
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var neck: String = ""
    @State private var waist: String = ""
    @State private var hip: String = ""  // Added hip circumference
    @State private var bodyFatPercentage: Double?
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        Text("Settings")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(10)
                        
                        // Name input field
                        InputField(title: "Name", value: $name, unit: "")
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Gender")
                                    .foregroundColor(.black)
                                
                                Picker("Gender", selection: $gender) {
                                    Text("Male")
                                        .tag(Gender.male)
                                        .foregroundColor(gender == .male ? .white : .black)
                                        .background(gender == .male ? Color.blue : Color.gray.opacity(0.3))
                                        .cornerRadius(8)
                                    
                                    Text("Female")
                                        .tag(Gender.female)
                                        .foregroundColor(gender == .female ? .white : .black)
                                        .background(gender == .female ? Color.blue : Color.gray.opacity(0.3))
                                        .cornerRadius(8)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                            InputField(title: "Age", value: $age, unit: "years")
                        }
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        
                        VStack(spacing: 15) {
                            HStack {
                                VStack {
                                    InputField(title: "Weight", value: $weight, unit: "kg")
                                    InputField(title: "Height", value: $height, unit: "cm")
                                }
                                
                                Spacer()
                                
                                VStack {
                                    InputField(title: "Neck", value: $neck, unit: "cm")
                                    InputField(title: "Waist", value: $waist, unit: "cm")
                                    
                                    if gender == .female {
                                        InputField(title: "Hip", value: $hip, unit: "cm")
                                    }
                                }
                            }
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                            if let bfp = bodyFatPercentage {
                                Text("Estimated fat percentage")
                                    .foregroundColor(.black)
                                Text(String(format: "%.1f%%", bfp))
                                    .font(.title)
                                    .foregroundColor(Color.orange)
                            }
                        }
                        .padding(10)
                        
                        HStack(spacing: 20) {
                            Button(action: calculateBFP) {
                                Text("Calculate")
                                    .padding(10)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: clearFields) {
                                Text("Clear")
                                    .padding(10)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(10)
                    
                    }
                    .padding(10)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func calculateBFP() {
        // Ensure all fields have valid numeric values
        guard let weight = Double(weight),
              let height = Double(height),
              let neck = Double(neck),
              let waist = Double(waist) else {
            bodyFatPercentage = nil
            return
        }
        
        if gender == .male {
            // Breaking down the formula for males
            let logWaistNeck = log10(waist - neck)
            let logHeight = log10(height)
            let bfp = 495 / (1.0324 - 0.19077 * logWaistNeck + 0.15456 * logHeight) - 450
            bodyFatPercentage = bfp.isNaN ? 0.0 : bfp
        } else {
            guard let hip = Double(hip) else {
                bodyFatPercentage = nil
                return
            }
            
            // Breaking down the formula for females
            let logWaistHipNeck = log10(waist + hip - neck)
            let logHeight = log10(height)
            let bfp = 495 / (1.29579 - 0.35004 * logWaistHipNeck + 0.22100 * logHeight) - 450
            bodyFatPercentage = bfp.isNaN ? 0.0 : bfp
        }
    }
    
    func clearFields() {
        name = ""
        age = ""
        weight = ""
        height = ""
        neck = ""
        waist = ""
        hip = ""  // Clear hip circumference
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
                .foregroundColor(.black)
            TextField("", text: $value)
                .keyboardType(.decimalPad)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5)
            Text(unit)
                .foregroundColor(.black)
        }
    }
}

enum Gender: String {
    case male = "male"
    case female = "female"
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
