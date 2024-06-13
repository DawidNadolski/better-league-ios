//
//  AddMatchViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

final class AddMatchViewModel: ObservableObject {
    
    let dateFormatter = DateFormatter()
    
    @Published var homeTeamName: String = ""
    @Published var awayTeamName: String = ""
    @Published var date: Date = Date()
    
    func addMatch() {
//        dateFormatter.dateFormat = "dd/MM/yyyy"
        let formatted = dateFormatter.string(from: date)
        print(formatted)
        
        let input = BetterLeagueAPI.MatchInput(homeTeamName: homeTeamName, awayTeamName: awayTeamName, date: date.ISO8601Format())
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
