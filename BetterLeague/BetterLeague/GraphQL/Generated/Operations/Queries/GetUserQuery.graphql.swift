// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class GetUserQuery: GraphQLQuery {
    static let operationName: String = "GetUser"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetUser { user { __typename id name bets { __typename id homeTeamGoals awayTeamGoals } } }"#
      ))

    public init() {}

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("user", User.self),
      ] }

      var user: User { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      struct User: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("name", String.self),
          .field("bets", [Bet?]?.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var bets: [Bet?]? { __data["bets"] }

        /// User.Bet
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