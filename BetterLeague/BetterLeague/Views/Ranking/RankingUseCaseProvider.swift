//
//  RankingUseCaseProvider.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 26/01/2025.
//

protocol RankingUseCaseProviderProtocol {
    func getRankingDisplayData() async -> [RankingRowDisplayData]
}

final class RankingUseCaseProvider: RankingUseCaseProviderProtocol {
    
    private let service: RankingServiceProtocol
    private let transformer: UserBetDataTransformer
    
    init(service: RankingServiceProtocol = RankingService(), transformer: UserBetDataTransformer = .init()) {
        self.service = service
        self.transformer = transformer
    }
    
    func getRankingDisplayData() async -> [RankingRowDisplayData] {
        let users = await service.getUsers()
        let sortedUsers = users
            .sorted {
                $0.bets.reduce(0, { $0 + ($1.points ?? 0) }) > $1.bets.reduce(0, { $0 + ($1.points ?? 0) })
            }
        return sortedUsers
            .enumerated()
            .map { index, user in
                RankingRowDisplayData(
                    id: user.id,
                    username: user.name,
                    rank: String(index + 1),
                    points: String(user.bets.reduce(0, { $0 + ($1.points ?? 0) })),
                    winningTeam: user.winningTeam?.name
                )
            }
    }
}
