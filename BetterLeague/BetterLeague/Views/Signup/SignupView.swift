//
//  SignupView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            TextField("Name", text: $viewModel.nameFieldText)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $viewModel.passwordFieldText)
                .textFieldStyle(.roundedBorder)
            TextField("Confirm password", text: $viewModel.confirmPasswordFieldText)
                .textFieldStyle(.roundedBorder)
            Button {
                viewModel.signUp()
            } label: {
                Text("Sign up")
            }
        }
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    SignupView()
}
