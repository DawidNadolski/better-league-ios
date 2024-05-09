//
//  AddTeamViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

final class AddTeamViewModel: ObservableObject {
    
    @Published var teamName: String = ""
    
    func addTeam() {
        APIService.shared.apollo.perform(mutation: BetterLeagueAPI.CreateTeamMutation(teamName: teamName)) { result in
            switch result {
            case .success(let graphQLResponse):
                print(graphQLResponse)
            case .failure(let error):
                return
            }
        }
    }
}
