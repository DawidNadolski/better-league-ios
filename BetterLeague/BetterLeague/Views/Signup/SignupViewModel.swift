//
//  SignupViewModel.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import Foundation

final class SignupViewModel: ObservableObject {
    
    @Published var nameFieldText: String = ""
    @Published var passwordFieldText: String = ""
    @Published var confirmPasswordFieldText: String = ""
    
    func signUp() {
        let input = BetterLeagueAPI.UserSignupInput(
            name: nameFieldText,
            password: passwordFieldText,
            confirmedPassword: confirmPasswordFieldText
        )
        APIService.shared.apollo.perform(mutation: BetterLeagueAPI.CreateUserMutation(input: input)) { result in
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
