//
//  RootFactory.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 04/12/2024.
//

protocol RootFactoryProtocol {
    func makeMatchesViewModel() -> MatchesViewModel
    func makeRankingViewModel() -> RankingViewModel
}

final class RootFactory: RootFactoryProtocol {
    
    private let matchesUseCaseProvider: MatchesUseCaseProviderProtocol
    private let rankingUseCaseProvider: RankingUseCaseProviderProtocol
    
    init(
        matchesUseCaseProvider: MatchesUseCaseProviderProtocol = MatchesUseCaseProvider(),
        rankingUseCaseProvider: RankingUseCaseProviderProtocol = RankingUseCaseProvider()
    ) {
        self.matchesUseCaseProvider = matchesUseCaseProvider
        self.rankingUseCaseProvider = rankingUseCaseProvider
    }
    
    func makeMatchesViewModel() -> MatchesViewModel {
        MatchesViewModel(
            dependencies: .init(
                getUserBetsUseCase: matchesUseCaseProvider.getUserBetsUseCase
            )
        )
    }
    
    func makeRankingViewModel() -> RankingViewModel {
        RankingViewModel(
            dependencies: .init(
                getDisplatData: rankingUseCaseProvider.getRankingDisplayData
            )
        )
    }
}
