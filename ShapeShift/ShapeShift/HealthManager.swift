//
//  HealthManager.swift
//  ShapeShift
//
//  Created by Sanath Warad on 10/8/24.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    init() {
        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [steps]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("Error requesting")
            }
        }
    }
}
