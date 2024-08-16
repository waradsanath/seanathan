import SwiftUI

// MainTabView containing the tab items
struct MainTabView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    init() {
        // Customize the tab bar appearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.systemBackground
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().unselectedItemTintColor = UIColor.secondaryLabel
    }
    
    var body: some View {
        TabView {
            NavigationView {
                MainView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationView {
                WorkoutPage()
            }
            .tabItem {
                Label("Workouts", systemImage: "figure.walk.circle.fill")
            }
        }
        .accentColor(.orange)
    }
}

// WorkoutPage view
struct WorkoutPage: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Workouts")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading], 27)
                
                Text("Cardio")
                    .font(.headline)
                    .padding(.leading, 27)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: RunningView()) {
                        WorkoutItemView(title: "Running", description: "Exercise info")
                    }
                    
                    NavigationLink(destination: CyclingView()) {
                        WorkoutItemView(title: "Cycling", description: "Exercise info")
                    }
                    
                    NavigationLink(destination: SwimmingView()) {
                        WorkoutItemView(title: "Swimming", description: "Exercise info")
                    }
                }
                .padding(.horizontal, 27)
                
                Text("Strength")
                    .font(.headline)
                    .padding(.leading, 27)
                
                NavigationLink(destination: PullUpsView()) {
                    WorkoutItemView(title: "Pull-Ups", description: "Exercise info")
                }
                .padding(.horizontal, 27)
            }
            .padding(.top, 40)
        }
        .navigationTitle("Workouts")
    }
}

// Reusable component for workout items
struct WorkoutItemView: View {
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.secondarySystemBackground))
                .frame(height: 75)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.orange)
                    .padding(.trailing, 20)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// Placeholder views for different workout types
struct RunningView: View {
    var body: some View {
        Text("Running View")
            .navigationTitle("Running")
    }
}

struct CyclingView: View {
    var body: some View {
        Text("Cycling View")
            .navigationTitle("Cycling")
    }
}

struct SwimmingView: View {
    var body: some View {
        Text("Swimming View")
            .navigationTitle("Swimming")
    }
}

struct PullUpsView: View {
    var body: some View {
        Text("Pull-Ups View")
            .navigationTitle("Pull-Ups")
    }
}

// Preview for MainTabView
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

#Preview {
    WorkoutPage()
}
