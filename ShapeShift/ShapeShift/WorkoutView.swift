import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Workout")
        }
    }
}

#Preview {
    WorkoutView()
        .environmentObject(HealthManager())
}
