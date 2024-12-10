//
//  MatchListRowFactory.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import Foundation

protocol MatchListRowFactoryProtocol {
    func makeBetEditViewModel(userBet: UserBet) -> BetEditViewModel
}

final class MatchListRowFactory: MatchListRowFactoryProtocol {
    
    private let useCaseProvider: BetEditUseCaseProvierProtocol
    
    init(useCaseProvider: BetEditUseCaseProvierProtocol = BetEditUseCaseProvier()) {
        self.useCaseProvider = useCaseProvider
    }
    
    func makeBetEditViewModel(userBet: UserBet) -> BetEditViewModel {
        let dependencies = BetEditViewModel.Dependencies(placeBetUseCase: useCaseProvider.makePlaceBetUseCase())
        return BetEditViewModel(userBet: userBet, dependencies: dependencies)
    }
}
