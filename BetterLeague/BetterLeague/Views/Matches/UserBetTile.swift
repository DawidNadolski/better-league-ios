//
//  UserBetTile.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 12/05/2024.
//

import SwiftUI

struct UserBetTile: View {
    
    private let displayData: UserBetDisplayData
    private let onBetButtonTap: (String) -> Void
    
    init(
        displayData: UserBetDisplayData,
        onBetButtonTap: @escaping (String) -> Void
    ){
        self.displayData = displayData
        self.onBetButtonTap = onBetButtonTap
    }
    
    var body: some View {
        HStack {
            VStack {
                switch displayData.state {
                case .notStarted:
                    makeNotStartedTile(with: displayData)
                case .live(let betResult):
                    makeLiveTile(with: displayData, betResult: betResult)
                case .ended(let betResult):
                    makeEndedTile(with: displayData, betResult: betResult)
                }
            }
            .background(displayData.betColor)
            
            Button(action: {
                //TODO: Show bet sheet
                onBetButtonTap(displayData.id)
            }, label: {
                Text(displayData.betButtonTitle)
            })
        }
        
    }
    
    func makeNotStartedTile(with displayData: UserBetDisplayData) -> some View {
        VStack {
            //TODO: Replace with actual date
            Text("Thu 16.07.2024 20:45")
            HStack(spacing: 4.0, content: {
                Text(displayData.homeTeamName)
                Text("-")
                Text(displayData.awayTeamName)
            })
            Text("Your bet")
            if displayData.isBet {
                HStack(spacing: 4.0, content: {
                    Text(displayData.homeTeamName)
                    Text(displayData.betHomeTeamGoals)
                    Text("-")
                    Text(displayData.betAwayTeamGoals)
                    Text(displayData.awayTeamName)
                })
            }
        }
    }
    
    func makeLiveTile(with displayData: UserBetDisplayData, betResult: BetResult) -> some View {
        VStack {
            Text("Live")
            Text("Score")
            HStack(spacing: 4.0, content: {
                Text(displayData.homeTeamName)
                Text(displayData.homeTeamGoals)
                Text("-")
                Text(displayData.awayTeamGoals)
                Text(displayData.awayTeamName)
            })
            Text("Your bet")
            HStack(spacing: 4.0, content: {
                Text(displayData.homeTeamName)
                Text(displayData.betHomeTeamGoals)
                Text("-")
                Text(displayData.betAwayTeamGoals)
                Text(displayData.awayTeamName)
            })
        }
    }
    
    func makeEndedTile(with displayData: UserBetDisplayData, betResult: BetResult) -> some View {
        VStack {
            Text("Ended")
            Text("Score")
            HStack(spacing: 4.0, content: {
                Text(displayData.homeTeamName)
                Text(displayData.homeTeamGoals)
                Text("-")
                Text(displayData.awayTeamGoals)
                Text(displayData.awayTeamName)
            })
            Text("Your bet")
            HStack(spacing: 4.0, content: {
                Text(displayData.homeTeamName)
                Text(displayData.betHomeTeamGoals)
                Text("-")
                Text(displayData.betAwayTeamGoals)
                Text(displayData.awayTeamName)
            })
        }
    }
}

#Preview("Not started bet not placed") {
    let displayData1 = UserBetDisplayData(
        id: "1",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "0",
        awayTeamName: "Germany",
        awayTeamGoals: "1",
        betAwayTeamGoals: "1",
        isBet: false,
        state: .notStarted
    )
    return UserBetTile(displayData: displayData1, onBetButtonTap: { _ in })
}

#Preview("Not started bet placed") {
    let displayData1 = UserBetDisplayData(
        id: "1",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "0",
        awayTeamName: "Germany",
        awayTeamGoals: "1",
        betAwayTeamGoals: "1",
        isBet: true,
        state: .notStarted
    )
    return UserBetTile(displayData: displayData1, onBetButtonTap: { _ in })
}

#Preview("Live bet placed correct result") {
    let displayData1 = UserBetDisplayData(
        id: "1",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "2",
        awayTeamName: "Germany",
        awayTeamGoals: "1",
        betAwayTeamGoals: "2",
        isBet: true,
        state: .live(.correctResult)
    )
    return UserBetTile(displayData: displayData1, onBetButtonTap: { _ in })
}

#Preview("Live bet placed exact result") {
    let displayData1 = UserBetDisplayData(
        id: "1",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "2",
        awayTeamName: "Germany",
        awayTeamGoals: "1",
        betAwayTeamGoals: "2",
        isBet: true,
        state: .live(.exactResult)
    )
    return UserBetTile(displayData: displayData1, onBetButtonTap: { _ in })
}

#Preview("Ended bet placed exact result") {
    let displayData1 = UserBetDisplayData(
        id: "1",
        homeTeamName: "Poland",
        homeTeamGoals: "1",
        betHomeTeamGoals: "2",
        awayTeamName: "Germany",
        awayTeamGoals: "1",
        betAwayTeamGoals: "1",
        isBet: true,
        state: .ended(.wrong)
    )
    return UserBetTile(displayData: displayData1, onBetButtonTap: { _ in })
}
