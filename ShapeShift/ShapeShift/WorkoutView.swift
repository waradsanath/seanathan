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
    let date = Date()
    @AppStorage("isDarkMode") var isDarkMode = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Workouts")
                        .font(
                            Font.custom("SF Pro", size: 50)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(UIColor.orange))
                        .padding(.top, 40)
                    Spacer()
                }
                .padding(.leading, 27)
                
                HStack {
                    Text("Cardio")
                        .font(
                            Font.custom("SF Pro", size: 24)
                                .weight(.semibold)
                        )
                    Spacer()
                }
                .padding([.leading], 27)
                .padding(.top, 1)
                .foregroundColor(.white)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 341, height: 75)
                        .background(Color(red: 0.06, green: 0.06, blue: 0.06))
                        .cornerRadius(5)
                    HStack {
                        VStack {
                            Text("Running")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                                .frame(width: 214, alignment: .leading)
                            Text("Exercise info, naggy sus mogijvisdjvs")
                                .font(
                                    Font.custom("SF Pro", size: 10)
                                        .weight(.regular)
                                )
                                .foregroundColor(.gray)
                                .frame(width: 214, alignment: .leading)
                        }
                        .padding(.leading, 30)
                        Spacer()
                        Image("Image")
                            .frame(width: 36, height: 36)
                            .padding()
                    }
                }
                .frame(width: 341, height: 75)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 341, height: 75)
                        .background(Color(red: 0.06, green: 0.06, blue: 0.06))
                        .cornerRadius(5)
                    HStack {
                        VStack {
                            Text("Cycling")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                                .frame(width: 214, alignment: .leading)
                            Text("Exercise info, naggy sus mogijvisdjvs")
                                .font(
                                    Font.custom("SF Pro", size: 10)
                                        .weight(.regular)
                                )
                                .foregroundColor(.gray)
                                .frame(width: 214, alignment: .leading)
                        }
                        .padding(.leading, 30)
                        Spacer()
                        Image("Image")
                            .frame(width: 36, height: 36)
                            .padding()
                    }
                }
                .frame(width: 341, height: 75)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 341, height: 75)
                        .background(Color(red: 0.06, green: 0.06, blue: 0.06))
                        .cornerRadius(5)
                    HStack {
                        VStack {
                            Text("Swimming")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                                .frame(width: 214, alignment: .leading)
                            Text("Exercise info, naggy sus mogijvisdjvs")
                                .font(
                                    Font.custom("SF Pro", size: 10)
                                        .weight(.regular)
                                )
                                .foregroundColor(.gray)
                                .frame(width: 214, alignment: .leading)
                        }
                        .padding(.leading, 30)
                        Spacer()
                        Image("Image")
                            .frame(width: 36, height: 36)
                            .padding()
                    }
                }
                .frame(width: 341, height: 75)
                
                Text("Muscles")
                    .font(
                        Font.custom("SF Pro", size: 24)
                            .weight(.semibold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 341, alignment: .topLeading)
                    .padding(.top, 15)
                    .padding(.leading, 10)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 341, height: 75)
                        .background(Color(red: 0.06, green: 0.06, blue: 0.06))
                        .cornerRadius(5)
                    HStack {
                        VStack {
                            Text("Pull-Ups")
                                .font(
                                    Font.custom("SF Pro", size: 22)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                                .frame(width: 214, alignment: .leading)
                                .padding(.leading, 25)
                            Text("Exercise info, naggy sus mogijvisdjvs")
                                .font(
                                    Font.custom("SF Pro", size: 10)
                                        .weight(.regular)
                                )
                                .foregroundColor(.gray)
                                .frame(width: 214, alignment: .leading)
                                .padding(.leading, 25)
                        }
                        .padding(.leading, 30)
                        Spacer()
                        Image("Image")
                            .frame(width: 36, height: 36)
                            .padding(.trailing, 45)
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 200)
            .padding(.top, 75)
            .frame(width: 393, height: 852)
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
        }
    }
}

// Preview for MainTabView
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
