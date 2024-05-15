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
    
    var apolloAuthorized: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let token = UserDefaults.standard.value(forKey: "userToken") as! String
        print(token)
        let url = URL(string: "http://localhost:8080/graphql")!
        let store = ApolloStore()
        let provider = DefaultInterceptorProvider(store: store)
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            additionalHeaders: ["Authorization":"\(token)"]
        )
        
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
}
