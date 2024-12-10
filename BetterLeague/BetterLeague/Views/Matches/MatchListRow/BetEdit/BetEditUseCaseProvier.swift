//
//  BetEditUseCaseProvier.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

protocol BetEditUseCaseProvierProtocol {
    func makePlaceBetUseCase() -> (PlaceBetInput) async throws -> String
}

final class BetEditUseCaseProvier: BetEditUseCaseProvierProtocol {
    
    private let service: MatchesServiceProtocol
    
    init(service: MatchesServiceProtocol = MatchesService()) {
        self.service = service
    }
    
    func makePlaceBetUseCase() -> (PlaceBetInput) async throws -> String {
        service.placeBet
    }
}
