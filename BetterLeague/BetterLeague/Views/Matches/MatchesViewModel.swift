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
        let transformUserBetUseCase: (UserBet) -> MatchListRowDisplayData
    }
    
    var userBetsDisplayData: [MatchListRowDisplayData] = []
    var unbetMatchesCount: Int = 0
    
    private let dependencies: Dependencies
    private var userBets = [UserBet]()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func onAppear() {
        fetchData()
    }
    
    private func fetchData() {
        Task {
            userBets = try await dependencies.getUserBetsUseCase()
            userBetsDisplayData = userBets.map(dependencies.transformUserBetUseCase)
            unbetMatchesCount = userBets.filter { $0.isBet }.count
        }
    }
}
