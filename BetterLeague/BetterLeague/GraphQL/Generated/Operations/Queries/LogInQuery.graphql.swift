// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class LogInQuery: GraphQLQuery {
    static let operationName: String = "LogIn"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query LogIn($input: UserLoginInput!) { logIn(input: $input) { __typename id name points bets { __typename id homeTeamGoals awayTeamGoals } } }"#
      ))

    public var input: UserLoginInput

    public init(input: UserLoginInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("logIn", LogIn.self, arguments: ["input": .variable("input")]),
      ] }

      var logIn: LogIn { __data["logIn"] }

      /// LogIn
      ///
      /// Parent Type: `User`
      struct LogIn: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("name", String.self),
          .field("points", Int.self),
          .field("bets", [Bet?]?.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var points: Int { __data["points"] }
        var bets: [Bet?]? { __data["bets"] }

        /// LogIn.Bet
        ///
        /// Parent Type: `Bet`
        struct Bet: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Bet }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BetterLeagueAPI.ID.self),
            .field("homeTeamGoals", Int.self),
            .field("awayTeamGoals", Int.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var homeTeamGoals: Int { __data["homeTeamGoals"] }
          var awayTeamGoals: Int { __data["awayTeamGoals"] }
        }
      }
    }
  }

}