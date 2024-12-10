//
//  MatchListRow.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/12/2024.
//

import SwiftUI

struct MatchListRow: View {
    var viewModel: MatchListRowViewModel
    @State private var isBetEditorPresented: Bool = false
        
    var body: some View {
        HStack(spacing: 0.0) {
            matchTimeStatus
            matchResultScore
            userBetScore
            matchTeams
            button
        }
        .frame(height: 64.0)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .sheet(isPresented: $isBetEditorPresented) {
            BetEditView(viewModel: viewModel.makeBetEditViewModel())
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    @ViewBuilder private var matchTimeStatus: some View {
        ZStack {
            Color.black.opacity(0.1)
            Text(viewModel.displayData.matchTimeStatus)
                .multilineTextAlignment(.center)
        }
        .frame(width: 64.0)
    }
    
    @ViewBuilder private var matchResultScore: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack(alignment: .center, spacing: 2.0) {
                Text("\(viewModel.displayData.homeTeamGoals)")
                    .frame(alignment: .center)
                Text("\(viewModel.displayData.awayTeamGoals)")
                    .frame(alignment: .center)
            }
        }
        .frame(width: 32.0)
    }
    
    @ViewBuilder private var userBetScore: some View {
        ZStack {
            viewModel.displayData.betColor
            VStack(alignment: .center, spacing: 2.0) {
                Text("\(viewModel.displayData.betHomeTeamGoals)")
                    .frame(alignment: .center)
                Text("\(viewModel.displayData.betAwayTeamGoals)")
                    .frame(alignment: .center)
            }
        }
        .frame(width: 32.0)
    }
    
    @ViewBuilder private var matchTeams: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack(alignment: .center, spacing: 2.0) {
                HStack {
                    Text(viewModel.displayData.homeTeamName)
                    Spacer()
                }
                HStack {
                    Text(viewModel.displayData.awayTeamName)
                    Spacer()
                }
            }
            .padding(.leading, 8.0)
        }
    }
    
    @ViewBuilder private var button: some View {
        ZStack {
            Color.black.opacity(0.1)
            Button {
                isBetEditorPresented = true
            } label: {
                Text(viewModel.displayData.betButtonTitle)
                    .font(.callout)
            }
        }
    }
}

#Preview("Exact ended result") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: true
            ),
            bet: .init(
                id: "1",
                matchId: "1",
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                )
            )
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}

#Preview("Correct ended result") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: true
            ),
            bet: .init(
                id: "1",
                matchId: "1",
                score: .init(
                    homeTeamGoals: 1,
                    awayTeamGoals: 1
                )
            )
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}

#Preview("Wrong ended result") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: true
            ),
            bet: .init(
                id: "1",
                matchId: "1",
                score: .init(
                    homeTeamGoals: 2,
                    awayTeamGoals: 1
                )
            )
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}

#Preview("Wrong live result") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: false
            ),
            bet: .init(
                id: "1",
                matchId: "1",
                score: .init(
                    homeTeamGoals: 1,
                    awayTeamGoals: 0
                )
            )
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}

#Preview("Upcoming match no bet") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: false
            ),
            bet: nil
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}

#Preview("Upcoming match bet") {
    MatchListRow(viewModel: .init(
        userBet: .init(
            match: .init(
                id: "1",
                homeTeam: .init(
                    id: "1",
                    name: "Poland"
                ),
                awayTeam: .init(
                    id: "2",
                    name: "Germany"
                ),
                score: .init(
                    homeTeamGoals: 0,
                    awayTeamGoals: 0
                ),
                startDate: Date(),
                hasEnded: false
            ),
            bet: .init(
                id: "1",
                matchId: "1",
                score: .init(
                    homeTeamGoals: 1,
                    awayTeamGoals: 1
                )
            )
        ),
        dependencies: .init(getDisplayData: { userBet in UserBetDataTransformer().transform(userBet) }))
    )
}
