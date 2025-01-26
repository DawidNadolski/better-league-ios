//
//  Match.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import Foundation

enum Result {
    case homeTeamWin
    case draw
    case awayTeamWin
}

struct Score {
    let homeTeamGoals: Int
    let awayTeamGoals: Int
    
    var result: Result {
        if homeTeamGoals == awayTeamGoals {
            return .draw
        }
        if homeTeamGoals > awayTeamGoals {
            return .homeTeamWin
        }
        return .awayTeamWin
    }
}

struct Match: Identifiable {
    let id: String
    let homeTeam: Team
    let awayTeam: Team
    let score: Score
    let startDate: Date
    let hasEnded: Bool
}

struct Team: Hashable {
    let id: String
    let name: String
}

extension Match {
    init?(responseData: GraphQLGetMatchesResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.id
        self.homeTeam = Team(responseData: data.homeTeam)
        self.awayTeam = Team(responseData: data.awayTeam)
        self.score = .init(homeTeamGoals: data.homeTeamGoals, awayTeamGoals: data.awayTeamGoals)
        //TODO: Get date from string
        self.startDate = Date()
        self.hasEnded = data.hasEnded
    }
    
    init?(responseData: GraphQLCreateMatchResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.createMatch.id
        self.homeTeam = .mock
        self.awayTeam = .mock
        self.score = .init(homeTeamGoals: 0, awayTeamGoals: 0)
        //TODO: Get date from string
        self.startDate = Date()
        self.hasEnded = false
    }
}

extension Team {
    init(responseData: BetterLeagueAPI.GetMatchesQuery.Data.Match.HomeTeam) {
        self.id = responseData.id
        self.name = responseData.name
    }
    
    init(responseData: BetterLeagueAPI.GetMatchesQuery.Data.Match.AwayTeam) {
        self.id = responseData.id
        self.name = responseData.name
    }
    
    static let mock = Team(id: "1", name: "Poland")
}
