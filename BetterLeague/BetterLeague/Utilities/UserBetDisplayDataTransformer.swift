//
//  UserBetDisplayDataTransformer.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 04/12/2024.
//

import Foundation

struct UserBetDisplayDataTransformer {
    func transform(_ userBets: [UserBet]) -> [UserBetDisplayData] {
        userBets
            .sorted(by: { $0.match.startDate < $1.match.startDate })
            .map { userBet in
                guard let bet = userBet.bet else {
                    return transformUnbetMatch(userBet)
                }
                let state = getState(userBet)
                print(userBet)
                
                return UserBetDisplayData(
                    id: userBet.match.id,
                    homeTeamName: userBet.match.homeTeam.name,
                    homeTeamGoals: "\(userBet.match.score.homeTeamGoals)",
                    betHomeTeamGoals: "\(bet.score.homeTeamGoals)",
                    awayTeamName: userBet.match.awayTeam.name,
                    awayTeamGoals: "\(userBet.match.score.awayTeamGoals)",
                    betAwayTeamGoals: "\(bet.score.awayTeamGoals)",
                    isBet: userBet.isBet,
                    state: state
                )
            }
    }
    
    private func transformUnbetMatch(_ userBet: UserBet) -> UserBetDisplayData {
        UserBetDisplayData(
            id: userBet.match.id,
            homeTeamName: userBet.match.homeTeam.name,
            homeTeamGoals: "\(userBet.match.score.homeTeamGoals)",
            betHomeTeamGoals: "",
            awayTeamName: userBet.match.awayTeam.name,
            awayTeamGoals: "\(userBet.match.score.awayTeamGoals)",
            betAwayTeamGoals: "",
            isBet: userBet.isBet,
            state: getState(userBet)
        )
    }

    private func getState(_ userBet: UserBet) -> UserBetDisplayData.State {
        let currentDate = Date()
        if userBet.match.startDate > currentDate {
            return .notStarted
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
}
