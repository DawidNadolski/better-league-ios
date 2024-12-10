//
//  BetEditViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import Foundation

@Observable
final class BetEditViewModel {
    
    struct Dependencies {
        let placeBetUseCase: (PlaceBetInput) async throws -> String
    }
    
    enum DisplayState {
        case content
        case error(Error)
        case loading
    }
    
    var awayTeamGoals: Int = 0
    var awayTeamName: String = ""
    var homeTeamGoals: Int = 0
    var homeTeamName: String = ""
    var displayState: DisplayState = .content
    var shouldDismissDrawer: Bool = false
    var userBet: UserBet
    
    private let dependencies: Dependencies
    
    init(userBet: UserBet, dependencies: Dependencies) {
        self.userBet = userBet
        self.dependencies = dependencies
        self.homeTeamGoals = userBet.bet?.score.homeTeamGoals ?? 0
        self.homeTeamName = userBet.match.homeTeam.name
        self.awayTeamGoals = userBet.bet?.score.awayTeamGoals ?? 0
        self.awayTeamName = userBet.match.awayTeam.name
    }
    
    func onRetry() {
        displayState = .content
    }
    
    func submitBet() async {
        displayState = .loading
        do {
            let betInput = PlaceBetInput(
                matchId: userBet.match.id,
                homeTeamGoals: homeTeamGoals,
                awayTeamGoals: awayTeamGoals
            )
            let betId = try await dependencies.placeBetUseCase(betInput)
            userBet.bet = Bet(id: betId, matchId: userBet.match.id, score: .init(homeTeamGoals: homeTeamGoals, awayTeamGoals: awayTeamGoals))
            shouldDismissDrawer = true
        } catch (let error) {
            print("BetEditViewModel: \(error.localizedDescription)")
            displayState = .error(error)
        }
    }
}

