//
//  RootViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import Foundation

enum RootTab: String, Hashable {
    case matches = "Matches"
    case ranking = "Ranking"
    case profile = "Profile"
}

@Observable final class RootViewModel {
    
    var matchesViewModel: MatchesViewModel
    var rankingViewModel: RankingViewModel
    var selectedTab: RootTab = .matches
    
    var navigationTitle: String {
        switch selectedTab {
        case .matches:
            "Matches"
        case .ranking:
            "Ranking"
        case .profile:
            "Profile"
        }
    }
    
    private let rootFactory: RootFactoryProtocol
    
    init(rootFactory: RootFactoryProtocol = RootFactory()) {
        self.rootFactory = rootFactory
        self.matchesViewModel = rootFactory.makeMatchesViewModel()
        self.rankingViewModel = rootFactory.makeRankingViewModel()
    }
}
