//
//  Bet.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import Foundation

struct Bet {
    let id: String
    let matchId: String
    let score: Score
    let isResolved: Bool
    let points: Int?
}
