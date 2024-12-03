// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class GetUsersQuery: GraphQLQuery {
    static let operationName: String = "GetUsers"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetUsers { users { __typename id name bets { __typename id match { __typename homeTeam { __typename name } awayTeam { __typename name } } homeTeamGoals awayTeamGoals } winningTeam { __typename id name } } }"#
      ))

    public init() {}

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("users", [User].self),
      ] }

      var users: [User] { __data["users"] }

      /// User
      ///
      /// Parent Type: `UserData`
      struct User: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.UserData }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("name", String.self),
          .field("bets", [Bet?]?.self),
          .field("winningTeam", WinningTeam?.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var bets: [Bet?]? { __data["bets"] }
        var winningTeam: WinningTeam? { __data["winningTeam"] }

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
            .field("match", Match.self),
            .field("homeTeamGoals", Int.self),
            .field("awayTeamGoals", Int.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var match: Match { __data["match"] }
          var homeTeamGoals: Int { __data["homeTeamGoals"] }
          var awayTeamGoals: Int { __data["awayTeamGoals"] }

          /// User.Bet.Match
          ///
          /// Parent Type: `Match`
          struct Match: BetterLeagueAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Match }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("homeTeam", HomeTeam.self),
              .field("awayTeam", AwayTeam.self),
            ] }

            var homeTeam: HomeTeam { __data["homeTeam"] }
            var awayTeam: AwayTeam { __data["awayTeam"] }

            /// User.Bet.Match.HomeTeam
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

            /// User.Bet.Match.AwayTeam
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

        /// User.WinningTeam
        ///
        /// Parent Type: `Team`
        struct WinningTeam: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BetterLeagueAPI.ID.self),
            .field("name", String.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var name: String { __data["name"] }
        }
      }
    }
  }

}