//
//  MatchesView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 08/05/2024.
//

import SwiftUI

struct MatchesView: View {
    
    @ObservedObject var viewModel = MatchesViewModel()
    
    var body: some View {
        VStack {
            NavigationLink("Add match") {
                AddMatchView()
            }
        }
    }
}

#Preview {
    MatchesView()
}
