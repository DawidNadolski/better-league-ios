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
        TabView {
            Tab("Matches", systemImage: "soccerball") {
                EmptyView()
            }
            
            Tab("Ranking", systemImage: "list.number") {
                EmptyView()
            }
            
            Tab("Profile", systemImage: "person") {
                EmptyView()
            }
        }
    }
}

#Preview {
    RootView()
}
