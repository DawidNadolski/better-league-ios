//
//  TeamsView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import SwiftUI

struct TeamsView: View {
    
    @ObservedObject var viewModel = TeamsViewModel()
    
    var body: some View {
        VStack {
            NavigationLink("Add team") {
                AddTeamView()
            }
        }
    }
}

#Preview {
    TeamsView()
}
