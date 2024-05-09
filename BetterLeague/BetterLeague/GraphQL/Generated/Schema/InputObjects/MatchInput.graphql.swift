// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension BetterLeagueAPI {
  struct MatchInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      homeTeamName: String,
      awayTeamName: String
    ) {
      __data = InputDict([
        "homeTeamName": homeTeamName,
        "awayTeamName": awayTeamName
      ])
    }

    var homeTeamName: String {
      get { __data["homeTeamName"] }
      set { __data["homeTeamName"] = newValue }
    }

    var awayTeamName: String {
      get { __data["awayTeamName"] }
      set { __data["awayTeamName"] = newValue }
    }
  }

}