//
//  TabBarView.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 28.05.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
