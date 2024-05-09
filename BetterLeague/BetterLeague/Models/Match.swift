//
//  Match.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import Foundation

struct Match {
    let id: String
    let homeTeam: Team
    let homeTeamGoals: Int
    let awayTeam: Team
    let awayTeamGoals: Int
    let startDate: Date
    let hasEnded: Bool
}

struct Team {
    let id: String
    let name: String
    let goalsScored: Int
    let goalsConceded: Int
}

extension Match {
    init?(responseData: GraphQLGetMatchesResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.id
        self.homeTeam = Team(responseData: data.homeTeam)
        self.homeTeamGoals = data.homeTeamGoals
        self.awayTeam = Team(responseData: data.awayTeam)
        self.awayTeamGoals = data.awayTeamGoals
        //TODO: Get date from string
        self.startDate = Date()
        self.hasEnded = data.ended ?? false
    }
    
    init?(responseData: GraphQLCreateMatchResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.createMatch.id
        self.homeTeam = .mock
        self.homeTeamGoals = 0
        self.awayTeam = .mock
        self.awayTeamGoals = 0
        //TODO: Get date from string
        self.startDate = Date()
        self.hasEnded = false
    }
}

extension Team {
    init(responseData: BetterLeagueAPI.GetMatchesQuery.Data.Match.HomeTeam) {
        self.id = responseData.id
        self.name = responseData.name
        self.goalsScored = responseData.goalsScored
        self.goalsConceded = responseData.goalsConceded
    }
    
    init(responseData: BetterLeagueAPI.GetMatchesQuery.Data.Match.AwayTeam) {
        self.id = responseData.id
        self.name = responseData.name
        self.goalsScored = responseData.goalsScored
        self.goalsConceded = responseData.goalsConceded
    }
    
    static let mock = Team(id: "1", name: "Poland", goalsScored: 0, goalsConceded: 0)
}
