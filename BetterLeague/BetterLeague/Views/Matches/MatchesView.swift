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
        Group {
            switch viewModel.displayState {
            case .content:
                contentView
            case .error(let error):
                makeErrorView(with: error)
            case .loading:
                loadingView
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("Matches")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder private var contentView: some View {
        VStack(spacing: 16.0) {
            List {
                ForEach(viewModel.userBets) { userBet in
                    MatchListRow(viewModel: viewModel.makeMatchListRowViewModel(with: userBet))
                }
            }
            .refreshable {
                viewModel.onRefresh()
            }
        }
    }
    
    @ViewBuilder private var loadingView: some View {
        ProgressView("Loading matches")
    }
    
    @ViewBuilder private func makeErrorView(with error: Error) -> some View {
        Text(error.localizedDescription)
    }
}


