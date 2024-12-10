//
//  BetEditView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/12/2024.
//

import SwiftUI

struct BetEditView: View {
    @State var viewModel: BetEditViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Group {
            switch viewModel.displayState {
            case .content:
                contentView
            case .error(let error):
                makeErrorView(with: error)
            case .loading:
                loadingView
            }
        }
        .onChange(of: viewModel.shouldDismissDrawer) {
            dismiss()
        }
    }
    
    @ViewBuilder private var contentView: some View {
        VStack {
            scorePickers
            Spacer()
            submitButton
        }
        .padding()
    }
    
    @ViewBuilder private var scorePickers: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center, spacing: 0.0) {
                Text(viewModel.homeTeamName)
                    .font(.title2)
                Picker("\(viewModel.homeTeamGoals)", selection: $viewModel.homeTeamGoals) {
                    ForEach(0..<11) { goalsCount in
                        Text("\(goalsCount)")
                    }
                }
                .pickerStyle(.wheel)
            }
            Text("-")
                .font(.title2)
            VStack(alignment: .center, spacing: 0.0) {
                Text(viewModel.awayTeamName)
                    .font(.title2)
                Picker("\(viewModel.awayTeamGoals)", selection: $viewModel.awayTeamGoals) {
                    ForEach(0..<11) { goalsCount in
                        Text("\(goalsCount)")
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .padding(.top, 48.0)
    }
    
    @ViewBuilder private var submitButton: some View {
        Button {
            Task {
                await viewModel.submitBet()
            }
        } label: {
            Text("Submit")
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
        }
    }
    
    @ViewBuilder private var loadingView: some View {
        ProgressView("Placing bet")
    }
    
    @ViewBuilder private func makeErrorView(with error: Error) -> some View {
        VStack(spacing: 16.0) {
            Text(error.localizedDescription)
            Button {
                viewModel.onRetry()
            } label: {
                Text("Retry")
                    .underline()
            }
        }
    }
}
