import SwiftUI
import AVKit

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
                        WorkoutItemView(title: "Running", description: "Improve cardiovascular health and endurance")
                            .multilineTextAlignment(.leading)
                    }
                    
                    NavigationLink(destination: CyclingView()) {
                        WorkoutItemView(title: "Cycling", description: "Low-impact exercise for leg strength and mobility")
                            .multilineTextAlignment(.leading)
                    }
                    
                    NavigationLink(destination: SwimmingView()) {
                        WorkoutItemView(title: "Swimming", description: "Full-body workout for endurance and relaxation")
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal, 27)
                
                Text("Strength")
                    .font(.headline)
                    .padding(.leading, 27)
                
                NavigationLink(destination: PullUpsView()) {
                    WorkoutItemView(title: "Pull-Ups", description: "Strengthen upper body muscles")
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 27)
            }
            .padding(.top, 40)
        }
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
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.orange)
                    .padding(.trailing, 20)
                    .accessibilityLabel("Navigate to \(title) details")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// Placeholder views for different workout types
struct RunningView: View {
    var body: some View {
        ExerciseDetailView(title: "Running Exercise", description: """
            Running is a great way to improve cardiovascular health, burn calories, and boost your mood. Make sure to warm up before starting and maintain a steady pace throughout your run.
            """, videoName: "Man Weights Fitness")
    }
}

struct CyclingView: View {
    var body: some View {
        ExerciseDetailView(title: "Cycling Exercise", description: """
            Cycling is an excellent low-impact exercise that strengthens your legs, improves joint mobility, and increases cardiovascular fitness. Always wear a helmet and stay hydrated.
            """, videoName: "Man Weights Fitness")
    }
}

struct SwimmingView: View {
    var body: some View {
        ExerciseDetailView(title: "Swimming Exercise", description: """
            Swimming is a full-body workout that builds endurance, muscle strength, and cardiovascular fitness. It’s also a great way to cool down and relax after a long day.
            """, videoName: "Man Weights Fitness")
    }
}

struct PullUpsView: View {
    var body: some View {
        ExerciseDetailView(title: "Pull-Ups Exercise", description: """
            Pull-ups are a fantastic way to strengthen your upper body, particularly your back, shoulders, and arms. Keep your core tight and focus on controlled movements for maximum benefit.
            """, videoName: "Man Weights Fitness")
    }
}

// Reusable detail view for exercises
struct ExerciseDetailView: View {
    var title: String
    var description: String
    var videoName: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Safe unwrapping of video URL
                if let videoURL = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(height: 250)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .accessibilityLabel("\(title) Video")
                } else {
                    Text("Video not available")
                        .foregroundColor(.red)
                        .font(.headline)
                }
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
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
