//
//  AddMatchViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

final class AddMatchViewModel: ObservableObject {
    
    @Published var homeTeamName: String = ""
    @Published var awayTeamName: String = ""
    
    func addMatch() {
        let input = BetterLeagueAPI.MatchInput(homeTeamName: homeTeamName, awayTeamName: awayTeamName)
        APIService.shared.apollo.perform(mutation: BetterLeagueAPI.CreateMatchMutation(input: input)) { result in
            switch result {
            case .success(let graphQLResponse):
                let match = Match(responseData: graphQLResponse.data)
                return
            case .failure(let error):
                return
            }
        }
    }
}
