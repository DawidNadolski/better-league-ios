//
//  UserBet.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 12/05/2024.
//

import Foundation

struct UserBet {
    let match: Match
    let bet: Bet?
    
    var isBet: Bool {
        bet != nil
    }
}