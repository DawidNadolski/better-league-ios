//
//  MatchesViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import Combine
import SwiftUI

enum BetResult: Int {
    case wrong = 0
    case correctResult = 1
    case exactResult = 3
    
    var points: Int {
        return self.rawValue
    }
}

struct UserBetDisplayData: Identifiable {
    var id: String
    let homeTeamName: String
    let homeTeamGoals: String
    let betHomeTeamGoals: String
    let awayTeamName: String
    let awayTeamGoals: String
    let betAwayTeamGoals: String
    let isBet: Bool
    let state: State
    
    enum State {
        case notStarted
        case live(BetResult)
        case ended(BetResult)
    }
    
    var betColor: Color {
        switch state {
        case .notStarted:
            return .cyan
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
        isBet ? "Edit bet" : "Place bet"
    }
}

final class MatchesViewModel: ObservableObject {
    
    @Published var userBets = [UserBetDisplayData]()
    @Published var homeTeamGoals: String = ""
    @Published var awayTeamGoals: String = ""
    
    private let modelManager = MatchesModelManager()
    private let displayDataTransformer = UserBetDisplayDataTransformer()
    
    func onAppear() {
        modelManager.fetchModels()
        setupBindings()
    }
    
    func betButtonTapped(with matchId: String) {
        let input = BetterLeagueAPI.BetInput(matchId: matchId, homeTeamGoals: Int(homeTeamGoals) ?? 20, awayTeamGoals: Int(awayTeamGoals) ?? 20)
        APIService.shared.apolloAuthorized.perform(mutation: BetterLeagueAPI.PlaceBetMutation(input: input)) { result in
            switch result {
            case .success(let graphQLResponse):
                print(graphQLResponse)
                guard let data = graphQLResponse.data else {
                    print("Something went wrong")
                    return
                }
            case .failure(let error):
                return
            }
        }
    }
    
    private func setupBindings() {
        modelManager.userBets
            .receive(on: DispatchQueue.main)
            .map(displayDataTransformer.transform(_:))
            .assign(to: &$userBets)
    }
}

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
