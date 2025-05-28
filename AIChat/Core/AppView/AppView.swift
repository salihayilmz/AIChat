//
//  AppView.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 27.05.2025.
//

import SwiftUI

// tabbar - signed in
// onboarding - signed out

struct AppView: View {

    @AppStorage("showTabbarView")  var showTabBar: Bool = false

    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
