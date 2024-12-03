//
//  GraphQLClient.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 03/12/2024.
//

import Apollo
import ApolloAPI
import Combine
import Foundation

protocol GraphQLClientProtocol {
    func fetch<Query>(query: Query) async throws -> GraphQLResult<Query.Data> where Query : GraphQLQuery
    func perform<Mutation>(mutation: Mutation) async throws -> GraphQLResult<Mutation.Data> where Mutation : GraphQLMutation
}

final class GraphQLClient: GraphQLClientProtocol {
    
    private let apolloClient = ApolloClient(url: URL(string: "https://better-league-service.onrender.com/graphql")!)
    private var apolloAuthorized: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let token = UserDefaults.standard.value(forKey: "userToken") as? String
        let url = URL(string: "https://better-league-service.onrender.com/graphql")!
        let store = ApolloStore()
        let provider = DefaultInterceptorProvider(store: store)
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            additionalHeaders: ["Authorization":"\(token ?? "")"]
        )
        
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    
    func fetch<Query>(query: Query) async throws -> GraphQLResult<Query.Data> where Query : GraphQLQuery {
        try await withCheckedThrowingContinuation { continuation in
            apolloAuthorized.fetch(query: query) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func perform<Mutation>(mutation: Mutation) async throws -> GraphQLResult<Mutation.Data> where Mutation : GraphQLMutation {
        try await withCheckedThrowingContinuation { continuation in
            apolloAuthorized.perform(mutation: mutation) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
