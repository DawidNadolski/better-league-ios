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
      awayTeamName: String,
      stage: String,
      date: Date
    ) {
      __data = InputDict([
        "homeTeamName": homeTeamName,
        "awayTeamName": awayTeamName,
        "stage": stage,
        "date": date
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

    var stage: String {
      get { __data["stage"] }
      set { __data["stage"] = newValue }
    }

    var date: Date {
      get { __data["date"] }
      set { __data["date"] = newValue }
    }
  }

}