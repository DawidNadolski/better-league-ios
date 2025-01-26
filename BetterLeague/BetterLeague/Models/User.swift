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
    let bets: [String]
}

extension User {
    init?(responseData: GraphQLCreateUserResponseData?) {
        guard let data = responseData else { return nil }
        self.id = data.createUser.id
        self.bets = data.createUser.bets?.compactMap { _ in "" } ?? []
        self.name = data.createUser.name
    }
}
