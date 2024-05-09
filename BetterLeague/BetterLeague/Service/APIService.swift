//
//  APIService.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/05/2024.
//

import Foundation
import Apollo

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)
}
