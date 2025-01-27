//
//  User.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import Foundation

struct User {
    let id: String
    let name: String
    let bets: [Bet]
    let winningTeam: Team?
    
    init(id: String, name: String, bets: [Bet] = [], winningTeam: Team?) {
        self.id = id
        self.name = name
        self.bets = bets
        self.winningTeam = winningTeam
    }
}

extension User {
    init?(responseData: GraphQLCreateUserResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.createUser.id
        self.bets = []
        self.name = data.createUser.name
        self.winningTeam = nil
    }
}
