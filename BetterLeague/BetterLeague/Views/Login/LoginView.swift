//
//  LoginView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            TextField("Username", text: $viewModel.nameFieldText)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $viewModel.passwordFieldText)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.logIn()
            } label: {
                Text("Log in")
            }
        }
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    LoginView()
}
