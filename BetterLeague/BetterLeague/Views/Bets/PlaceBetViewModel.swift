//
//  PlaceBetViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

final class PlaceBetViewModel: ObservableObject {
    
    @Published var homeTeamGoals: String = ""
    @Published var awayTeamGoals: String = ""
    
    func placeBet() {
        let input = BetterLeagueAPI.BetInput(matchId: "663bd56f3a094789880a9068", homeTeamGoals: Int(homeTeamGoals)!, awayTeamGoals: Int(awayTeamGoals)!)
        APIService.shared.apollo.perform(mutation: BetterLeagueAPI.PlaceBetMutation(input: input)) { result in
            switch result {
            case .success(let graphQLResponse):
                print(graphQLResponse)
                guard let data = graphQLResponse.data else {
                    print("Something went wrong")
                    return
                }
                let user = User(id: data.placeBet.better.id, name: data.placeBet.better.name, bets: [])
                let homeTeam = Team(id: "", name: data.placeBet.match.homeTeam.name, goalsScored: 0, goalsConceded: 0)
                let awayTeam = Team(id: "", name: data.placeBet.match.awayTeam.name, goalsScored: 0, goalsConceded: 0)
                let match = Match(
                    id: data.placeBet.match.id,
                    homeTeam: homeTeam,
                    homeTeamGoals: 0,
                    awayTeam: awayTeam,
                    awayTeamGoals: 0,
                    startDate: Date(),
                    hasEnded: false
                )
                let bet = Bet(id: data.placeBet.id, homeTeamGoals: data.placeBet.homeTeamGoals, awayTeamGoals: data.placeBet.awayTeamGoals, match: match, better: user)
                print(bet)
                return
            case .failure(let error):
                return
            }
        }
    }
}
