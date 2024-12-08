//
//  UserBet.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 12/05/2024.
//

import Foundation

@Observable class UserBet: Identifiable, Equatable {
    static func == (lhs: UserBet, rhs: UserBet) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String { bet?.id ?? match.id }
    
    let match: Match
    var bet: Bet?
    
    init(match: Match, bet: Bet? = nil) {
        self.match = match
        self.bet = bet
    }
    
    var isBet: Bool {
        bet != nil
    }
}
