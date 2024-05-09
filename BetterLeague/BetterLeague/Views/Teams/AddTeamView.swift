//
//  AddTeamView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import SwiftUI

struct AddTeamView: View {
    
    @ObservedObject var viewModel = AddTeamViewModel()
    
    var body: some View {
        VStack {
            TextField("Home team name", text: $viewModel.teamName)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.addTeam()
            } label: {
                Text("Submit")
            }
        }
        .padding()
    }
}

#Preview {
    AddTeamView()
}
