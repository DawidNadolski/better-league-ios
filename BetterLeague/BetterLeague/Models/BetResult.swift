//
//  BetResult.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 06/12/2024.
//

enum BetResult: Int {
    case wrong = 0
    case correctResult = 1
    case exactResult = 3
    
    var points: Int {
        return self.rawValue
    }
}
