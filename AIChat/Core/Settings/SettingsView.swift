//
//  SettingsView.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 28.05.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignoutPressed()
                } label: {
                    Text("Sign out")
                }

            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignoutPressed() {
        // do some logic to sign user out of app.
        dismiss()
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
        
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
