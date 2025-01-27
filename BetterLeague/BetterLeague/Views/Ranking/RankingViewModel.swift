//
//  RankingViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 27/01/2025.
//

import Foundation

struct RankingRowDisplayData: Identifiable {
    let id: String
    let username: String
    let rank: String
    let points: String
    let winningTeam: String?
}

@Observable final class RankingViewModel {
    
    struct Dependencies {
        let getDisplatData: () async -> [RankingRowDisplayData]
    }
    
    enum DisplayState {
        case loading
        case content([RankingRowDisplayData])
        case error(Error)
    }
    
    var displayState: DisplayState = .loading
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func onAppear() {
        Task {
            await fetchData()
        }
    }
    
    private func fetchData() async {
        let displayData = await dependencies.getDisplatData()
        displayState = .content(displayData)
    }
}
