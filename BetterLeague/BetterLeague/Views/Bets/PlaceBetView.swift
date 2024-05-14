//
//  PlaceBetView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import SwiftUI

struct PlaceBetView: View {
    
    @ObservedObject var viewModel = PlaceBetViewModel()
    
    var body: some View {
        VStack {
            TextField("Match ID", text: $viewModel.matchId)
                .textFieldStyle(.roundedBorder)
            TextField("Home team goals", text: $viewModel.homeTeamGoals)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            TextField("Away team goals", text: $viewModel.awayTeamGoals)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Button {
                viewModel.placeBet()
            } label: {
                Text("Submit")
            }
        }
        .padding()
    }
}

#Preview {
    PlaceBetView()
}
