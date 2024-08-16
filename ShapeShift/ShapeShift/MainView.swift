import SwiftUI

struct MainView: View {
    let date = Date()
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: WorkoutPage()) { // Instantiate WorkoutPage with ()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Item 1")
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                
                // Additional UI elements can go here
            }
            .navigationTitle("Main View") // Set the navigation title
        }
    }
}

#Preview {
    MainView()
}
