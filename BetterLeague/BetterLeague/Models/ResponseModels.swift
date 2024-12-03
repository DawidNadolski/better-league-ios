//
//  ResponseModels.swift
//  BetterLeague
//
//  Created by Dawid Nadolski on 05/05/2024.
//

import Foundation

typealias GraphQLCreateUserResponseData = BetterLeagueAPI.CreateUserMutation.Data
typealias GraphQLLoginResponseData = BetterLeagueAPI.LogInQuery.Data
typealias GraphQLGetMatchesResponseData = BetterLeagueAPI.GetMatchesQuery.Data.Match
typealias GraphQLCreateMatchResponseData = BetterLeagueAPI.CreateMatchMutation.Data
