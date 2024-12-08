//
//  UserBetDataTransformer.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 04/12/2024.
//

import Foundation

struct UserBetDataTransformer {
    func transform(_ userBet: UserBet) -> MatchListRowDisplayData {
        let state = getState(userBet)
        let timeStatus = getTimeStatus(userBet)
        guard let bet = userBet.bet else {
            return transformUnbetMatch(userBet, timeStatus: timeStatus, state: state)
        }
        
        return MatchListRowDisplayData(
            id: userBet.match.id,
            matchTimeStatus: timeStatus,
            homeTeamName: userBet.match.homeTeam.name,
            homeTeamGoals: state == .upcoming ? "-" : "\(userBet.match.score.homeTeamGoals)",
            betHomeTeamGoals: "\(bet.score.homeTeamGoals)",
            awayTeamName: userBet.match.awayTeam.name,
            awayTeamGoals: state == .upcoming ? "-" : "\(userBet.match.score.awayTeamGoals)",
            betAwayTeamGoals: "\(bet.score.awayTeamGoals)",
            isBet: userBet.isBet,
            state: state
        )
    }
    
    private func transformUnbetMatch(_ userBet: UserBet, timeStatus: String, state: MatchListRowDisplayData.State) -> MatchListRowDisplayData {
        return MatchListRowDisplayData(
            id: userBet.match.id,
            matchTimeStatus: timeStatus,
            homeTeamName: userBet.match.homeTeam.name,
            homeTeamGoals: state == .upcoming ? "-" :  "\(userBet.match.score.homeTeamGoals)",
            betHomeTeamGoals: "-",
            awayTeamName: userBet.match.awayTeam.name,
            awayTeamGoals: state == .upcoming ? "-" :  "\(userBet.match.score.awayTeamGoals)",
            betAwayTeamGoals: "-",
            isBet: userBet.isBet,
            state: getState(userBet)
        )
    }

    private func getState(_ userBet: UserBet) -> MatchListRowDisplayData.State {
        let currentDate = Date()
        if userBet.match.startDate > currentDate {
            return .upcoming
        }
        
        let result = getResult(userBet)
        if userBet.match.startDate < currentDate && !userBet.match.hasEnded {
            return .live(result)
        }
        return .ended(result)
    }
    
    private func getResult(_ userBet: UserBet) -> BetResult {
        guard let bet = userBet.bet else {
            return .wrong
        }
        
        let match = userBet.match
        if (match.score.homeTeamGoals == bet.score.homeTeamGoals) && (match.score.awayTeamGoals == bet.score.awayTeamGoals) {
            return .exactResult
        }
        if (bet.score.result == match.score.result) {
            return .correctResult
        }
        
        return .wrong
    }
    
    private func getTimeStatus(_ userBet: UserBet) -> String {
        let state = getState(userBet)
        let day = userBet.match.startDate.formatted(date: .numeric, time: .omitted)
        switch state {
        case .upcoming:
            return day
        case .live:
            return "Live"
        case .ended:
            return "FT"
        }
    }
}
