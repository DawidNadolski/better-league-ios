//
//  RootView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import SwiftUI

struct RootView: View {
    
    let viewModel = RootViewModel()
    
    var body: some View {
        VStack(spacing: 12.0) {
            NavigationLink("Log in") {
                LoginView()
            }
            NavigationLink("Sign up") {
                SignupView()
            }
            NavigationLink("Matches") {
                MatchesView()
            }
            NavigationLink("Team") {
                TeamsView()
            }
        }
        .padding()
    }
}

#Preview {
    RootView()
}
