// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class GetUserBetsQuery: GraphQLQuery {
    static let operationName: String = "GetUserBets"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetUserBets($userId: ID!) { bets(userId: $userId) { __typename id homeTeamGoals awayTeamGoals match { __typename id homeTeam { __typename name } homeTeamGoals awayTeam { __typename name } awayTeamGoals startDate hasEnded } } }"#
      ))

    public var userId: ID

    public init(userId: ID) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("bets", [Bet].self, arguments: ["userId": .variable("userId")]),
      ] }

      var bets: [Bet] { __data["bets"] }

      /// Bet
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
          .field("match", Match.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var homeTeamGoals: Int { __data["homeTeamGoals"] }
        var awayTeamGoals: Int { __data["awayTeamGoals"] }
        var match: Match { __data["match"] }

        /// Bet.Match
        ///
        /// Parent Type: `Match`
        struct Match: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Match }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BetterLeagueAPI.ID.self),
            .field("homeTeam", HomeTeam.self),
            .field("homeTeamGoals", Int.self),
            .field("awayTeam", AwayTeam.self),
            .field("awayTeamGoals", Int.self),
            .field("startDate", BetterLeagueAPI.Date.self),
            .field("hasEnded", Bool.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var homeTeam: HomeTeam { __data["homeTeam"] }
          var homeTeamGoals: Int { __data["homeTeamGoals"] }
          var awayTeam: AwayTeam { __data["awayTeam"] }
          var awayTeamGoals: Int { __data["awayTeamGoals"] }
          var startDate: BetterLeagueAPI.Date { __data["startDate"] }
          var hasEnded: Bool { __data["hasEnded"] }

          /// Bet.Match.HomeTeam
          ///
          /// Parent Type: `Team`
          struct HomeTeam: BetterLeagueAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
            ] }

            var name: String { __data["name"] }
          }

          /// Bet.Match.AwayTeam
          ///
          /// Parent Type: `Team`
          struct AwayTeam: BetterLeagueAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
            ] }

            var name: String { __data["name"] }
          }
        }
      }
    }
  }

}