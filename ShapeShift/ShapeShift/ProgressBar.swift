//
//  ProgressBar.swift
//  CuratED
//
//  Created by Sanath Warad on 28/7/24.
//

import SwiftUI

struct ProgressBar: View {
    var totalWidth: CGFloat
    var percentage: CGFloat
    var colorBackground: Color
    var colorForeground: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: totalWidth, height: 20)
                .foregroundColor(colorBackground)
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: totalWidth * (percentage / 100), height: 20, alignment: .leading)
                    .foregroundColor(colorForeground)
                Spacer()
            }
        }
    }
}

#Preview {
    ProgressBar(totalWidth: 400, percentage: 20, colorBackground: .gray, colorForeground: .green)
}
