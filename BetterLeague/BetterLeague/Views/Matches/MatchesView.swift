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
                ForEach(viewModel.userBets.map(\.match)) { match in
                    HStack(spacing: 0.0) {
                        ZStack {
                            Color.red
                            Text("FT")
                                .frame(alignment: .center)
                        }
                        .frame(width: 64.0)
                        
                        ZStack {
                            Color.green
                            VStack(alignment: .center, spacing: 2.0) {
                                Text("\(match.score.homeTeamGoals)")
                                    .frame(alignment: .center)
                                Text("\(match.score.awayTeamGoals)")
                                    .frame(alignment: .center)
                            }
                        }
                        .frame(width: 32.0)
                        
                        ZStack {
                            Color.black.opacity(0.1)
                            VStack(alignment: .center, spacing: 2.0) {
                                HStack {
                                    Text(match.homeTeam.name)
                                    Spacer()
                                }
                                HStack {
                                    Text(match.awayTeam.name)
                                    Spacer()
                                }
                            }
                            .padding(.leading, 8.0)
                        }
                    }
                    .frame(height: 64.0)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
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

#Preview {
    MatchesView(viewModel: .init(dependencies: .init(getUserBetsUseCase: { [] })))
}
