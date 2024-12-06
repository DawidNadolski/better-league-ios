//
//  MatchListRow.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/12/2024.
//

import SwiftUI

struct MatchListRow: View {
    private let displayData: MatchListRowDisplayData
    
    init(displayData: MatchListRowDisplayData) {
        self.displayData = displayData
    }
    
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
    }
    
    @ViewBuilder
    private var matchTimeStatus: some View {
        ZStack {
            Color.black.opacity(0.1)
            Text(displayData.matchTimeStatus)
                .multilineTextAlignment(.center)
        }
        .frame(width: 64.0)
    }
    
    @ViewBuilder
    private var matchResultScore: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack(alignment: .center, spacing: 2.0) {
                Text("\(displayData.homeTeamGoals)")
                    .frame(alignment: .center)
                Text("\(displayData.awayTeamGoals)")
                    .frame(alignment: .center)
            }
        }
        .frame(width: 32.0)
    }
    
    @ViewBuilder
    private var userBetScore: some View {
        ZStack {
            displayData.betColor
            VStack(alignment: .center, spacing: 2.0) {
                Text("\(displayData.betHomeTeamGoals)")
                    .frame(alignment: .center)
                Text("\(displayData.betAwayTeamGoals)")
                    .frame(alignment: .center)
            }
        }
        .frame(width: 32.0)
    }
    
    @ViewBuilder
    private var matchTeams: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack(alignment: .center, spacing: 2.0) {
                HStack {
                    Text(displayData.homeTeamName)
                    Spacer()
                }
                HStack {
                    Text(displayData.awayTeamName)
                    Spacer()
                }
            }
            .padding(.leading, 8.0)
        }
    }
    
    //TODO: Add button action
    @ViewBuilder
    private var button: some View {
        ZStack {
            Color.black.opacity(0.1)
            Button {
                print("Button tapped")
            } label: {
                Text(displayData.betButtonTitle)
                    .font(.callout)
            }
        }
    }
}

#Preview("Exact ended result") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "FT",
        homeTeamName: "Poland",
        homeTeamGoals: "0",
        betHomeTeamGoals: "0",
        awayTeamName: "Germany",
        awayTeamGoals: "0",
        betAwayTeamGoals: "0",
        isBet: true,
        state: .ended(.exactResult)
    ))
}

#Preview("Correct ended result") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "FT",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "2",
        awayTeamName: "Germany",
        awayTeamGoals: "0",
        betAwayTeamGoals: "0",
        isBet: true,
        state: .ended(.correctResult)
    ))
}

#Preview("Wrong ended result") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "FT",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "0",
        awayTeamName: "Germany",
        awayTeamGoals: "2",
        betAwayTeamGoals: "0",
        isBet: true,
        state: .ended(.wrong)
    ))
}

#Preview("Wrong live result") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "Live",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "0",
        awayTeamName: "Germany",
        awayTeamGoals: "2",
        betAwayTeamGoals: "0",
        isBet: true,
        state: .live(.wrong)
    ))
}

#Preview("Upcoming match no bet") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "20:45\nThu.",
        homeTeamName: "Poland",
        homeTeamGoals: "-",
        betHomeTeamGoals: "-",
        awayTeamName: "Germany",
        awayTeamGoals: "-",
        betAwayTeamGoals: "-",
        isBet: false,
        state: .upcoming
    ))
}

#Preview("Upcoming match bet") {
    MatchListRow(displayData: MatchListRowDisplayData(
        id: "1",
        matchTimeStatus: "20:45\nThu.",
        homeTeamName: "Poland",
        homeTeamGoals: "-",
        betHomeTeamGoals: "1",
        awayTeamName: "Germany",
        awayTeamGoals: "-",
        betAwayTeamGoals: "1",
        isBet: true,
        state: .upcoming
    ))
}
