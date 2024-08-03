import SwiftUI

// MainTabView containing the tab items
struct MainTabView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    init() {
        // Customize the tab bar appearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        TabView {
            NavigationView {
                MainView()
            }
            .tabItem {
                Label("Homepage", systemImage: "house.fill")
            }
            
            NavigationView {
                WorkoutPage()
            }
            .tabItem {
                Label("Workouts", systemImage: "dumbbell.fill")
            }
        }
        .accentColor(.orange) // Set the accent color for the selected tab
    }
}

// WorkoutPage view
struct WorkoutPage: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.11, blue: 0.12)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Workouts")
                        .font(
                            Font.custom("SF Pro", size: 50)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(UIColor.orange))
                        .padding([.top, .leading], 27)
                    
                    Text("Cardio")
                        .font(
                            Font.custom("SF Pro", size: 24)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .padding(.leading, 27)
                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: RunningView()) {
                            WorkoutItemView(title: "Running", description: "Exercise info, naggy sus mogijvisdjvs")
                        }
                        
                        NavigationLink(destination: CyclingView()) {
                            WorkoutItemView(title: "Cycling", description: "Exercise info, naggy sus mogijvisdjvs")
                        }
                        
                        NavigationLink(destination: SwimmingView()) {
                            WorkoutItemView(title: "Swimming", description: "Exercise info, naggy sus mogijvisdjvs")
                        }
                    }
                    .padding(.horizontal, 27)
                    
                    Text("Muscles")
                        .font(
                            Font.custom("SF Pro", size: 24)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .padding(.leading, 27)
                    
                    NavigationLink(destination: PullUpsView()) {
                        WorkoutItemView(title: "Pull-Ups", description: "Exercise info, naggy sus mogijvisdjvs")
                    }
                    .padding(.horizontal, 27)
                }
                .padding(.top, 40)
            }
        }
    }
}

// Reusable component for workout items
struct WorkoutItemView: View {
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 75)
                .background(Color(red: 0.06, green: 0.06, blue: 0.06))
                .cornerRadius(5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(
                            Font.custom("SF Pro", size: 22)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(
                            Font.custom("SF Pro", size: 10)
                                .weight(.regular)
                        )
                        .foregroundColor(.gray)
                }
                .padding(.leading, 30)
                
                Spacer()
                
                Image("Image")
                    .padding(.trailing, 40)
            }
        }
        .frame(width: 341)
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
