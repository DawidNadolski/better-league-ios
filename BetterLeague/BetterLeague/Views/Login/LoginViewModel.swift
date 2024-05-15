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
                guard let data = graphQLResponse.data else {
                    print("Failed logging in user")
                    return
                }
                let userId = data.logIn.userId
                let userToken = data.logIn.token
                UserDefaults.standard.set(userToken, forKey: "userToken")
            case .failure(let error):
                return
            }
        }
    }
}
