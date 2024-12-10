//
//  MatchesService.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/12/2024.
//

import Foundation

protocol MatchesServiceProtocol {
    func fetchMatches() async throws -> [Match]
    func fetchUserBets() async throws -> [Bet]
    func placeBet(with input: PlaceBetInput) async throws -> String
}

final class MatchesService: MatchesServiceProtocol {
    
    private let client: GraphQLClientProtocol
    
    init(client: GraphQLClientProtocol = GraphQLClient()) {
        self.client = client
    }
    
    func fetchMatches() async throws -> [Match] {
        let query = BetterLeagueAPI.GetMatchesQuery()
        let response = try await client.fetch(query: query)
        guard let data = response.data else { return [] }
        //TODO: Move mapping the model to some converter
        return data.matches.compactMap { match -> Match? in
            guard let matchModel = match else { return nil }
            let homeTeam = Team(id: matchModel.homeTeam.id, name: matchModel.homeTeam.name)
            let awayTeam = Team(id: matchModel.awayTeam.id, name: matchModel.awayTeam.name)
            let score = Score(homeTeamGoals: matchModel.homeTeamGoals, awayTeamGoals: matchModel.awayTeamGoals)
            //TODO: Convert date from GraphQL's string date
            let date = Date()
            let match = Match(id: matchModel.id, homeTeam: homeTeam, awayTeam: awayTeam, score: score, startDate: date, hasEnded: matchModel.hasEnded)
            return match
        }
    }
    
    func fetchUserBets() async throws -> [Bet] {
        //TODO: Fetch bets of logged user
        []
    }
    
    func placeBet(with input: PlaceBetInput) async throws -> String {
        let mutation = BetterLeagueAPI.PlaceBetMutation(input: input)
        let response = try await client.perform(mutation: mutation)
        guard let data = response.data else {
            return UUID().uuidString
        }
        return data.placeBet.id
    }
}
