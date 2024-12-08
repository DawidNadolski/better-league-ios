//
//  MatchListRowDisplayData.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 06/12/2024.
//

import SwiftUI

struct MatchListRowDisplayData: Identifiable {
    var id: String
    let matchTimeStatus: String
    let homeTeamName: String
    let homeTeamGoals: String
    let betHomeTeamGoals: String
    let awayTeamName: String
    let awayTeamGoals: String
    let betAwayTeamGoals: String
    let isBet: Bool
    let state: State
    
    enum State: Equatable {
        case upcoming
        case live(BetResult)
        case ended(BetResult)
    }
    
    var betColor: Color {
        switch state {
        case .upcoming:
            return .red
        case .live(let result), .ended(let result):
            switch result {
            case .wrong:
                return .red
            case .correctResult:
                return .orange
            case .exactResult:
                return .green
            }
        }
    }
    
    var betButtonTitle: String {
        switch state {
        case .upcoming:
            return isBet ? "Edit bet" : "Place bet"
        case .live, .ended:
            return "See bets"
        }
        
    }
}
