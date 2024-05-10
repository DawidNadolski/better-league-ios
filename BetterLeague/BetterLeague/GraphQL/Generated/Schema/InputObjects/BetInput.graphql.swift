// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension BetterLeagueAPI {
  struct BetInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      matchId: ID,
      homeTeamGoals: Int,
      awayTeamGoals: Int
    ) {
      __data = InputDict([
        "matchId": matchId,
        "homeTeamGoals": homeTeamGoals,
        "awayTeamGoals": awayTeamGoals
      ])
    }

    var matchId: ID {
      get { __data["matchId"] }
      set { __data["matchId"] = newValue }
    }

    var homeTeamGoals: Int {
      get { __data["homeTeamGoals"] }
      set { __data["homeTeamGoals"] = newValue }
    }

    var awayTeamGoals: Int {
      get { __data["awayTeamGoals"] }
      set { __data["awayTeamGoals"] = newValue }
    }
  }

}