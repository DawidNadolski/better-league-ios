//
//  MatchesViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import Foundation

final class MatchesViewModel: ObservableObject {
    
    @Published var matches = [Match]()
    
    func fetchMatches() {
        APIService.shared.apollo.fetch(query: BetterLeagueAPI.GetMatchesQuery()) { result in
            print(result)
            switch result {
            case .success(let graphQLResponse):
                let fetchedMatches = graphQLResponse.data?.matches.compactMap { Match(responseData: $0)}
                self.matches = fetchedMatches!
                return
            case .failure(let error):
                return
            }
        }
    }
}
