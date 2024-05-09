//
//  RootViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import Apollo
import Foundation

final class RootViewModel {
    
    init() { }
    
    @Published var user: User? = nil
    
    func fetchUser() {
        APIService.shared.apollo.fetch(query: BetterLeagueAPI.GetUserQuery()) { result in
            switch result {
            case .success(let graphQLResponse):
                guard let user = User(responseData: graphQLResponse.data) else {
                    return
                }
            case .failure(let error):
                return
            }
        }
    }
}
