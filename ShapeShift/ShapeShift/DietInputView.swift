import SwiftUI

struct DietEditView: View {
    @State var text: String
    var title: String
    var body: some View {
        HStack {
            Text(title)
            TextField(title, text: $text)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .foregroundColor(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
        }
    }
}

#Preview {
    DietEditView(text: "Enter food here", title: "Food")
}
