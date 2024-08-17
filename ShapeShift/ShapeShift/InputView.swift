//
//  InputView.swift
//  ShapeShift
//
//  Created by Sanath Warad on 30/7/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var title: String
    var unit: String
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .padding(.top)
            HStack {
                TextField("Enter \(title)", text: $text)
                    .padding()
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                    Text(unit)
            }
        }
    }
}

#Preview {
    InputView(text: .constant("title"), title: "Title", unit: "unit")
}
