//
//  SettingsView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 12/8/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("name") var name: String = ""
    @AppStorage("gender") var gender: Gender = .male
    @AppStorage("age") var age: String = ""
    @AppStorage("weight") var weight: String = ""
    @AppStorage("height") var height: String = ""
    @AppStorage("neck") var neck: String = ""
    @AppStorage("waist") var waist: String = ""
    @AppStorage("hip") var hip: String = ""
    @AppStorage("bodyFatPercentage") var bodyFatPercentage: Double?
    var body: some View {
        NavigationStack {
            VStack {
                InputView(text: $name, title: "Name", unit: "")
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
                        .onChange(of: gender) {
                            calculateBFP()
                        }
                    }
                    .padding(10)
                    
                    InputView(text: $age, title: "Age", unit: "years")
                }
                VStack(spacing: 15) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            InputView(text: $weight, title: "Weight", unit: "kg")
                                .onChange(of: weight) {
                                    calculateBFP()
                                }
                            
                            InputView(text: $height, title: "Height", unit: "cm")
                                .onChange(of: height) {
                                    calculateBFP()
                                }
                            if gender == .female {
                                InputView(text: $hip, title: "Hip circum.", unit: "cm")
                                    .onChange(of: hip) {
                                        calculateBFP()
                                    }
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            InputView(text: $neck, title: "Neck circum.", unit: "cm")
                                .onChange(of: neck) {
                                    calculateBFP()
                                }
                            
                            InputView(text: $waist, title: "Waist circum.", unit: "cm")
                                .onChange(of: waist) {
                                    calculateBFP()
                                }
                        }
                    }
                    .padding(10)
                }
                if let bfp = bodyFatPercentage {
                    Text("Estimated Fat Percentage")
                    Text(String(format: "%.1f%%", bfp))
                        .font(.title)
                        .foregroundColor(Color.orange)
                }
            }
            .padding()
            .frame(alignment: .top)
            Spacer()
                .navigationTitle("Settings")
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

enum Gender: String {
    case male = "male"
    case female = "female"
}

#Preview {
    SettingsView()
}
