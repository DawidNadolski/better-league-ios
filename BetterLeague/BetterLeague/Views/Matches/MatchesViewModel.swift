//
//  MatchesViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import SwiftUI

@Observable final class MatchesViewModel: ObservableObject {
    
    struct Dependencies {
        let getUserBetsUseCase: () async throws -> [UserBet]
    }
    
    var unbetMatchesCount: Int = 0
    var userBets = [UserBet]()
    
    private let dependencies: Dependencies
    private let matchesFactory: MatchesFactoryProtocol
    
    init(dependencies: Dependencies, matchesFactory: MatchesFactoryProtocol = MatchesFactory()) {
        self.dependencies = dependencies
        self.matchesFactory = matchesFactory
    }
    
    func onAppear() {
        fetchData()
    }
    
    func makeMatchListRowViewModel(with userBet: UserBet) -> MatchListRowViewModel {
        matchesFactory.makeMatchListRowViewModel(with: userBet)
    }
    
    private func fetchData() {
        Task {
            userBets = try await dependencies.getUserBetsUseCase()
            unbetMatchesCount = userBets.filter { $0.isBet }.count
        }
    }
}
