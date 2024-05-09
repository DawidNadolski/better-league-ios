//
//  LoginViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var nameFieldText: String = ""
    @Published var passwordFieldText: String = ""
    
    func logIn() {
        let input = BetterLeagueAPI.UserLoginInput(
            name: nameFieldText,
            password: passwordFieldText
        )
        APIService.shared.apollo.fetch(query: BetterLeagueAPI.LogInQuery(input: input)) { result in
            switch result {
            case .success(let graphQLResponse):
                guard let user = User(responseData: graphQLResponse.data) else {
                    return
                }
                print(user)
            case .failure(let error):
                return
            }
        }
    }
}
