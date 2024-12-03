//
//  RootViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import Foundation

@Observable final class RootViewModel {
    
    private let rootFactory: RootFactoryProtocol
    
    init(rootFactory: RootFactoryProtocol = RootFactory()) {
        self.rootFactory = rootFactory
    }
}
