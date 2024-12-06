//
//  MatchesView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import SwiftUI

struct MatchesView: View {
    
    var viewModel: MatchesViewModel
    
    init(viewModel: MatchesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 16.0) {
            List {
                ForEach(viewModel.userBetsDisplayData) { displayData in
                    MatchListRow(displayData: displayData)
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
