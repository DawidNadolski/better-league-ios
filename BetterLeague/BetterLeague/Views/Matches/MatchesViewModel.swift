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

@Observable final class MatchesViewModel: ObservableObject {
    
    struct Dependencies {
        let getUserBetsUseCase: () async throws -> [UserBet]
    }
    
    var userBets = [UserBet]()
    var unbetMatchesCount: Int = 0
    
    private let dependencies: Dependencies
    private let modelManager = MatchesModelManager()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func onAppear() {
        fetchData()
    }
    
    private func fetchData() {
        Task {
            userBets = try await dependencies.getUserBetsUseCase()
            unbetMatchesCount = userBets.filter { $0.isBet }.count
        }
    }
}
