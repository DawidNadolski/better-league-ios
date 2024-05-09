//
//  AddMatchView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import SwiftUI

struct AddMatchView: View {
    
    @ObservedObject var viewModel = AddMatchViewModel()
    
    var body: some View {
        VStack {
            TextField("Home team name", text: $viewModel.homeTeamName)
                .textFieldStyle(.roundedBorder)
            TextField("Away team name", text: $viewModel.awayTeamName)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.addMatch()
            } label: {
                Text("Submit")
            }
        }
        .padding()
    }
}

#Preview {
    AddMatchView()
}