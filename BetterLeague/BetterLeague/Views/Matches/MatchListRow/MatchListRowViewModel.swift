//
//  MatchListRowViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import Foundation

@Observable class MatchListRowViewModel {
    
    struct Dependencies {
        let getDisplayData: (UserBet) -> MatchListRowDisplayData
    }
    
    var displayData: MatchListRowDisplayData
    var userBet: UserBet
    
    private let dependencies: Dependencies
    private let factory: MatchListRowFactoryProtocol
    
    init(userBet: UserBet, dependencies: Dependencies, factory: MatchListRowFactoryProtocol = MatchListRowFactory()) {
        self.userBet = userBet
        self.dependencies = dependencies
        self.factory = factory
        self.displayData = dependencies.getDisplayData(userBet)
    }
    
    func onAppear() {
        displayData = dependencies.getDisplayData(userBet)
    }
    
    func onUserBetChange() {
        displayData = dependencies.getDisplayData(userBet)
    }
    
    func makeBetEditViewModel() -> BetEditViewModel {
        factory.makeBetEditViewModel(userBet: userBet)
    }
}
