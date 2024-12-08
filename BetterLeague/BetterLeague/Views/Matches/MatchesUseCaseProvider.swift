//
//  MatchesUseCaseProvider.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 04/12/2024.
//

protocol MatchesUseCaseProviderProtocol {
    func getUserBetsUseCase() async throws -> [UserBet]
}

final class MatchesUseCaseProvider: MatchesUseCaseProviderProtocol {
    
    private let service: MatchesServiceProtocol
    
    init(service: MatchesServiceProtocol = MatchesService()) {
        self.service = service
    }
    
    func getUserBetsUseCase() async throws -> [UserBet] {
        let matches = try await service.fetchMatches()
        let bets = try await service.fetchUserBets()
        return matches.map { match in
            let userBet = bets.first(where: { $0.matchId == match.id })
            return UserBet(match: match, bet: userBet)
        }
    }
}
