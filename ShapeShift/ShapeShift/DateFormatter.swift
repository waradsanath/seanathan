//
//  DateFormatter.swift
//  ShapeShift
//
//  Created by Sanath Warad on 13/7/24.
//

import Foundation

extension DateFormatter {
    static let custom: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, EEEE"
        return formatter
    }()
}
