//
//  RootFactory.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 04/12/2024.
//

protocol RootFactoryProtocol {
    func makeMatchesViewModel() -> MatchesViewModel
}

final class RootFactory: RootFactoryProtocol {
    
    private let matchesUseCaseProvider: MatchesUseCaseProviderProtocol
    
    init(matchesUseCaseProvider: MatchesUseCaseProviderProtocol = MatchesUseCaseProvider()) {
        self.matchesUseCaseProvider = matchesUseCaseProvider
    }
    
    func makeMatchesViewModel() -> MatchesViewModel {
        MatchesViewModel(
            dependencies: .init(
                getUserBetsUseCase: matchesUseCaseProvider.getUserBetsUseCase
            )
        )
    }
}
