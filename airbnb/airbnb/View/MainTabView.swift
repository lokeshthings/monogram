//
//  MainTabView.swift
//  Airbnb
//
//  Created by Lokesh on 13/09/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")}
            
            WishlistView()
                .tabItem{
                    Label("Wishlist", systemImage: "heart")
                }
            
            
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person")
                }
        }
    
    }
}

#Preview {
    MainTabView()
}
