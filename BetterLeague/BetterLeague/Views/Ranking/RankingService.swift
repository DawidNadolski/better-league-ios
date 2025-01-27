//
//  RankingService.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 26/01/2025.
//

protocol RankingServiceProtocol {
    func getUsers() async -> [User]
}

enum RankingServiceError: Error {
    case noData
}

final class RankingService: RankingServiceProtocol {
    
    private let client: GraphQLClientProtocol
    
    init(client: GraphQLClientProtocol = GraphQLClient()) {
        self.client = client
    }
    
    func getUsers() async -> [User] {
        let query = BetterLeagueAPI.GetUsersQuery()
        do {
            let response = try await client.fetch(query: query)
            guard let users = response.data?.users else {
                throw RankingServiceError.noData
            }
            return users.map {
                let bets = $0.bets?.compactMap { bet -> Bet? in
                    guard let bet else { return nil }
                    return Bet(
                        id: bet.id,
                        matchId: bet.match.id,
                        score: Score(homeTeamGoals: bet.homeTeamGoals, awayTeamGoals: bet.awayTeamGoals),
                        isResolved: bet.isResolved,
                        points: bet.points
                    )
                }
                return User(id: $0.id, name: $0.name, bets: bets ?? [], winningTeam: Team(responseData: $0.winningTeam))
            }
        } catch (let error) {
            return []
        }
    }
}
