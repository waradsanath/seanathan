//
//  DateFormatter.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import Foundation

extension DateFormatter {
    // A static computed property to provide a date formatter with a custom format
    static let custom: DateFormatter = {
        let formatter = DateFormatter()
        // Setting the date format to "dd MMMM, EEEE"
        formatter.dateFormat = "dd MMMM, EEEE"
        return formatter
    }()
}
