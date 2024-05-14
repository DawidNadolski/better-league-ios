//
//  PlaceBetViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

final class PlaceBetViewModel: ObservableObject {
    
    @Published var matchId: String = ""
    @Published var homeTeamGoals: String = ""
    @Published var awayTeamGoals: String = ""
    
    func placeBet() {
        let input = BetterLeagueAPI.BetInput(matchId: matchId, homeTeamGoals: Int(homeTeamGoals)!, awayTeamGoals: Int(awayTeamGoals)!)
        APIService.shared.apollo.perform(mutation: BetterLeagueAPI.PlaceBetMutation(input: input)) { result in
            switch result {
            case .success(let graphQLResponse):
                print(graphQLResponse)
                guard let data = graphQLResponse.data else {
                    print("Something went wrong")
                    return
                }
            case .failure(let error):
                return
            }
        }
    }
}
