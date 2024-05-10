//
//  Bet.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

struct Bet {
    let id: String
    let homeTeamGoals: Int
    let awayTeamGoals: Int
    let match: Match
    let better: User
}
