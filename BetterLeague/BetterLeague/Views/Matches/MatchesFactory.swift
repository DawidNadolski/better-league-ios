//
//  MatchesFactory.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import Foundation

protocol MatchesFactoryProtocol {
    func makeMatchListRowViewModel(with userBet: UserBet) -> MatchListRowViewModel
}

struct MatchesFactory: MatchesFactoryProtocol {
    private let useCaseProvider: MatchListRowUseCaseProviderProtocol
    
    init(useCaseProvider: MatchListRowUseCaseProviderProtocol = MatchListRowUseCaseProvider()) {
        self.useCaseProvider = useCaseProvider
    }
    
    func makeMatchListRowViewModel(with userBet: UserBet) -> MatchListRowViewModel {
        .init(
            userBet: userBet,
            dependencies: .init(getDisplayData: useCaseProvider.makeGetDisplayDataUseCase())
        )
    }
}
