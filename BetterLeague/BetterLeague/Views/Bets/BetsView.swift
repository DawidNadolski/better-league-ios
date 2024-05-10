//
//  BetsView.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 09/05/2024.
//

import SwiftUI

struct BetsView: View {
    
    @ObservedObject var viewModel = BetsViewModel()
    
    var body: some View {
        VStack {
            NavigationLink("Place bet") {
                PlaceBetView()
            }
        }
    }
}

#Preview {
    BetsView()
}
