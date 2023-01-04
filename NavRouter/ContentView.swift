//
//  ContentView.swift
//  NavRouter
//
//  Created by Sajjad Sarkoobi on 3.01.2023.
//

import SwiftUI

enum Tabs: String {
    case home = "Home"
    case feeds = "Feeds"
    case profile = "Profile"
}

struct ContentView: View {
    
    @State var selectedTab: Tabs = .home
    @State private var tappedTwice: Bool = false
    
    @StateObject var homeNav = Router()
    @StateObject var feedsNav = Router()
    @StateObject var profileNav = Router()
    
    var handler: Binding<Tabs> { Binding(
        get: { selectedTab },
        set: {
            if $0 == selectedTab {
                print("selectedTab == \(selectedTab.rawValue)")
                tappedTwice = true
            }
            selectedTab = $0
        }
    )}
    
    var body: some View {
        TabView(selection: handler) {
            homeTab
                .tabItem {
                    Label(Tabs.home.rawValue, systemImage: "house")
                }
                .tag(Tabs.home)
            
            feedsTab
                .tabItem {
                    Label(Tabs.feeds.rawValue, systemImage: "newspaper")
                }
                .tag(Tabs.feeds)
            
            profileTab
                .tabItem {
                    Label(Tabs.profile.rawValue, systemImage: "person")
                }
                .tag(Tabs.profile)
        }
    }
}

extension ContentView {
    var homeTab: some View {
        NavigationStack(path: $homeNav.path) {
            HomeTabView()
                .onChange(of: tappedTwice, perform: { tappedTwice in
                      guard tappedTwice else { return }
                    if selectedTab == .home {
                          self.tappedTwice = false
                          print("Home tapped twice!!!")
                          homeNav.popToRoot()
                      }
                  })
                .navigationTitle("Home")
                .navigationDestination(for: Paths.self) { path in
                    path.view
                }
        }
        .environmentObject(homeNav)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var feedsTab: some View {
        NavigationStack(path: $feedsNav.path) {
            FeedsTabView()
                .onChange(of: tappedTwice, perform: { tappedTwice in
                      guard tappedTwice else { return }
                    if selectedTab == .feeds {
                          self.tappedTwice = false
                          print("Feeds tapped twice!!!")
                          feedsNav.popToRoot()
                      }
                  })
                .navigationTitle("Feeds")
                .navigationDestination(for: Paths.self) { path in
                    path.view
                }
        }
        .environmentObject(feedsNav)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var profileTab: some View {
        NavigationStack(path: $profileNav.path) {
            ProfileTabView()
                .onChange(of: tappedTwice, perform: { tappedTwice in
                      guard tappedTwice else { return }
                    if selectedTab == .profile {
                          self.tappedTwice = false
                          print("Profile tapped twice!!!")
                          profileNav.popToRoot()
                      }
                  })
                .navigationTitle("Profile")
                .navigationDestination(for: Paths.self) { path in
                    path.view
                }
        }
        .environmentObject(profileNav)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
