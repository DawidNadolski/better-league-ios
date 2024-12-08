//
//  BetEditView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import SwiftUI

struct BetEditView: View {
    @Bindable var userBet: UserBet
    @Environment(\.dismiss) private var dismiss
    @State private var homeTeamGoals: Int = 0
    @State private var awayTeamGoals: Int = 0
    
    var body: some View {
        VStack {
            scorePickers
            Spacer()
            submitButton
        }
        .padding()
        .onAppear {
            homeTeamGoals = userBet.bet?.score.homeTeamGoals ?? 0
            awayTeamGoals = userBet.bet?.score.awayTeamGoals ?? 0
        }
    }
    
    @ViewBuilder
    private var scorePickers: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center, spacing: 0.0) {
                Text(userBet.match.homeTeam.name)
                Picker("\(homeTeamGoals)", selection: $homeTeamGoals) {
                    ForEach(0..<11) { goal in
                        Text("\(goal)")
                    }
                }
                .pickerStyle(.wheel)
            }
            Text("-")
            VStack(alignment: .center, spacing: 0.0) {
                Text(userBet.match.awayTeam.name)
                Picker("\(awayTeamGoals)", selection: $awayTeamGoals) {
                    ForEach(0..<11) { goal in
                        Text("\(goal)")
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .padding(.top, 48.0)
    }
    
    @ViewBuilder
    private var submitButton: some View {
        Button {
            //TODO: Actually send the bet to the service
            let bet = Bet(
                id: UUID().uuidString,
                matchId: userBet.match.id,
                score: .init(
                    homeTeamGoals: homeTeamGoals,
                    awayTeamGoals: awayTeamGoals
                )
            )
            userBet.bet = bet
            dismiss()
        } label: {
            Text("Submit")
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    BetEditView(userBet: .init(match: .init(id: "1", homeTeam: .init(id: "1", name: "Poland"), awayTeam: .init(id: "2", name: "Germany"), score: .init(homeTeamGoals: 0, awayTeamGoals: 0), startDate: Date(), hasEnded: false)))
}
