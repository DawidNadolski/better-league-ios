//
//  MatchesModelManager.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 10/05/2024.
//

import Combine
import Foundation

protocol MatchesModelManagerProtocol {
    var bets: AnyPublisher<[Bet], Never> { get }
    var matches: AnyPublisher<[Match], Never> { get }
    var userBets: AnyPublisher<[UserBet], Never> { get }
    func fetchModels()
}

final class MatchesModelManager: MatchesModelManagerProtocol {
    
    private var cancellables = Set<AnyCancellable>()

    private let matchesSubject = CurrentValueSubject<[Match], Never>([])
    var matches: AnyPublisher<[Match], Never> {
        matchesSubject.eraseToAnyPublisher()
    }
    
    private let betsSubject = CurrentValueSubject<[Bet], Never>([])
    var bets: AnyPublisher<[Bet], Never> {
        betsSubject.eraseToAnyPublisher()
    }
    
    private let userBetsSubject = CurrentValueSubject<[UserBet], Never>([])
    var userBets: AnyPublisher<[UserBet], Never> {
        userBetsSubject.eraseToAnyPublisher()
    }
    
    init() {
        setupBindings()
    }
    
    func fetchModels() {
        fetchBets()
        fetchMatches()
    }
    
    private func fetchMatches() {
        APIService.shared.apollo.fetch(query: BetterLeagueAPI.GetMatchesQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResponse):
                guard let data = graphQLResponse.data else { return }
                let matches = data.matches.compactMap { match -> Match? in
                    guard let matchModel = match else { return nil }
                    let homeTeam = Team(id: matchModel.homeTeam.id, name: matchModel.homeTeam.name, goalsScored: 0, goalsConceded: 0)
                    let awayTeam = Team(id: matchModel.awayTeam.id, name: matchModel.awayTeam.name, goalsScored: 0, goalsConceded: 0)
                    let score = Score(homeTeamGoals: matchModel.homeTeamGoals, awayTeamGoals: matchModel.awayTeamGoals)
                    //TODO: Convert date from GraphQL's string date
                    let date = Date()
                    let match = Match(id: matchModel.id, homeTeam: homeTeam, awayTeam: awayTeam, score: score, startDate: date, hasEnded: matchModel.hasEnded)
                    return match
                }
                self?.matchesSubject.send(matches)
            case .failure(let error):
                return
            }
        }
    }
    
    private func fetchBets() {
        let userId = "663eaf479b23e651a88c9a68"
        APIService.shared.apollo.fetch(query: BetterLeagueAPI.GetUserBetsQuery(userId: userId)) { [weak self] result in
            switch result {
            case .success(let graphQLResponse):
                print(graphQLResponse)
                guard let data = graphQLResponse.data else { return }
                let bets = data.bets.map { bet in
                    let score = Score(homeTeamGoals: bet.homeTeamGoals, awayTeamGoals: bet.awayTeamGoals)
                    return Bet(id: bet.id, matchId: bet.match.id, score: score)
                }
                self?.betsSubject.send(bets)
            case .failure(let error):
                return
            }
        }
    }
    
    private func setupBindings() {
        let betsAndMatches = Publishers.CombineLatest(
                betsSubject.eraseToAnyPublisher(),
                matchesSubject.eraseToAnyPublisher()
            )
            .eraseToAnyPublisher()
            .share()
        
        betsAndMatches
            .map({ bets, matches -> [UserBet] in
                matches.map { match in
                    let userBet = bets.first(where: { $0.matchId == match.id })
                    return UserBet(match: match, bet: userBet)
                }
            })
            .sink { [weak self] userBets in self?.userBetsSubject.send(userBets) }
            .store(in: &cancellables)
    }
}
