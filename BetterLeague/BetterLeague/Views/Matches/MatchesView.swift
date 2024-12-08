//
//  MatchesView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import SwiftUI

struct MatchesView: View {
    @Environment(MatchesViewModel.self) private var viewModel
    
    var body: some View {
        VStack(spacing: 16.0) {
            List {
                ForEach(viewModel.userBets) { userBet in
                    MatchListRow(viewModel: viewModel.makeMatchListRowViewModel(with: userBet))
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("Matches")
        .navigationBarTitleDisplayMode(.inline)
    }
}


