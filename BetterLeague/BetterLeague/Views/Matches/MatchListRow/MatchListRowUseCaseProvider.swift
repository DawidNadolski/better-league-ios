//
//  MatchListRowUseCaseProvider.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import Foundation

protocol MatchListRowUseCaseProviderProtocol {
    func makeGetDisplayDataUseCase() -> (UserBet) -> (MatchListRowDisplayData)
}

struct MatchListRowUseCaseProvider: MatchListRowUseCaseProviderProtocol {
    private let transformer: UserBetDataTransformer
    
    init(transformer: UserBetDataTransformer = .init()) {
        self.transformer = transformer
    }
    
    func makeGetDisplayDataUseCase() -> ((UserBet) -> MatchListRowDisplayData) {
        let transformer = UserBetDataTransformer()
        return transformer.transform
    }
}
