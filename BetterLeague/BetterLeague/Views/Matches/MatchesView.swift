//
//  MatchesView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import SwiftUI

struct MatchesView: View {
    
    @ObservedObject var viewModel: MatchesViewModel
    
    init(viewModel: MatchesViewModel = MatchesViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 16.0) {
            List {
                ForEach(viewModel.userBets) { userBet in
                    UserBetTile(displayData: userBet) { matchId in
                        viewModel.betButtonTapped(with: matchId)
                    }
                }
            }
            TextField("Home team goals", text: $viewModel.homeTeamGoals)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            TextField("Away team goals", text: $viewModel.awayTeamGoals)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            NavigationLink("Add match") {
                AddMatchView()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    MatchesView()
}
