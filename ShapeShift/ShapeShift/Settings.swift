import SwiftUI

struct SettingsView: View {
    @State private var name: String = ""
    @State private var gender: Gender = .male
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var neck: String = ""
    @State private var waist: String = ""
    @State private var hip: String = ""
    @State private var bodyFatPercentage: Double?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Settings")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(10)
                        Spacer()
                    }
                    
                    // Name input field
                    InputSection(title: "Name", value: $name)
                        .padding([.leading, .trailing], 10)
                    
                    // Gender picker and age input
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 10) {
                            Text("Gender")
                                .fontWeight(.semibold)
                                .font(.system(size: 22))
                            
                            Picker("Gender", selection: $gender) {
                                Text("Male").tag(Gender.male)
                                Text("Female").tag(Gender.female)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .onChange(of: gender, perform: { _ in calculateBFP() })
                        }
                        .padding(10)
                        
                        InputSection(title: "Age", value: $age, unit: "years")
                    }
                    .padding(10)
                    
                    // Body composition inputs
                    VStack(spacing: 20) {
                        HStack {
                            Text("Body Composition")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        VStack(spacing: 15) {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    InputSection(title: "Weight", value: $weight, unit: "kg")
                                        .onChange(of: weight, perform: { _ in calculateBFP() })
                                    
                                    InputSection(title: "Height", value: $height, unit: "cm")
                                        .onChange(of: height, perform: { _ in calculateBFP() })
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    InputSection(title: "Neck", value: $neck, unit: "cm")
                                        .onChange(of: neck, perform: { _ in calculateBFP() })
                                    
                                    InputSection(title: "Waist", value: $waist, unit: "cm")
                                        .onChange(of: waist, perform: { _ in calculateBFP() })
                                    
                                    if gender == .female {
                                        InputSection(title: "Hip", value: $hip, unit: "cm")
                                            .onChange(of: hip, perform: { _ in calculateBFP() })
                                    }
                                }
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                                .shadow(color: .gray, radius: 5, x: 0, y: 2))
                        }
                        
                        if let bfp = bodyFatPercentage {
                            Text("Estimated Fat Percentage")
                            Text(String(format: "%.1f%%", bfp))
                                .font(.title)
                                .foregroundColor(Color.orange)
                        }
                    }
                    .padding(10)
                    
                    // Buttons
                    HStack(spacing: 20) {
                        Button(action: calculateBFP) {
                            Text("Retry")
                                .padding(10)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding(10)
                }
                .padding(10)
                .navigationBarHidden(true)
            }
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
            let logWaistNeck = log10(waist - neck)
            let logHeight = log10(height)
            let bfp = 495 / (1.0324 - 0.19077 * logWaistNeck + 0.15456 * logHeight) - 450
            bodyFatPercentage = bfp.isNaN ? 0.0 : bfp
        } else {
            guard let hip = Double(hip) else {
                bodyFatPercentage = nil
                return
            }
            
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
        hip = ""
        bodyFatPercentage = nil
    }
}

struct InputSection: View {
    let title: String
    @Binding var value: String
    let unit: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .fontWeight(.semibold)
            HStack {
                TextField("", text: $value)
                    .keyboardType(.decimalPad)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                if let unit = unit {
                    Text(unit)
                }
            }
        }
    }
    
    init(title: String, value: Binding<String>, unit: String? = nil) {
        self.title = title
        self._value = value
        self.unit = unit
    }
}

enum Gender: String {
    case male = "male"
    case female = "female"
}

#Preview {
    SettingsView()
}
