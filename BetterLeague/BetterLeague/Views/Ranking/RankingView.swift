//
//  RankingView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 26/01/2025.
//

import SwiftUI

struct RankingView: View {
    
    @Environment(RankingViewModel.self) var viewModel: RankingViewModel
    
    var body: some View {
        Group {
            switch viewModel.displayState {
            case .loading:
                ProgressView {
                    Text("Loading ranking")
                }
            case .content(let displayData):
                List {
                    ForEach(displayData) { data in
                        HStack {
                            Text(data.rank)
                            Text(data.username)
                            Text(data.points)
                            Text(data.winningTeam ?? "")
                        }
                    }
                }
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    RankingView()
}
