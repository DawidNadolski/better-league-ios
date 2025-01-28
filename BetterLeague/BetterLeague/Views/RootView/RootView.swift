//
//  RootView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import SwiftUI

struct RootView: View {
    
    @State var viewModel = RootViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            Tab("Matches", systemImage: "soccerball", value: .matches) {
                MatchesView()
                    .environment(viewModel.matchesViewModel)
            }
            .badge(viewModel.matchesViewModel.unbetMatchesCount)
            
            Tab("Ranking", systemImage: "list.number", value: .ranking) {
                RankingView()
                    .environment(viewModel.rankingViewModel)
            }
            
            Tab("Profile", systemImage: "person", value: .profile) {
                EmptyView()
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    //TODO: Show menu
                    print("Tapped")
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

#Preview {
    RootView()
}
