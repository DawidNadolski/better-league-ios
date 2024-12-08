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
    
    enum DisplayState {
        case content
        case error(Error)
        case loading
    }
    
    var displayState: DisplayState = .loading
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
        displayState = .loading
        Task {
            do {
                userBets = try await dependencies.getUserBetsUseCase()
                unbetMatchesCount = userBets.filter { $0.isBet }.count
                displayState = .content
            } catch(let error) {
                //TODO: Add proper error handling
                displayState = .error(error)
                print(error.localizedDescription)
            }
        }
    }
}
