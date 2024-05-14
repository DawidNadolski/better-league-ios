// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class GetMatchesQuery: GraphQLQuery {
    static let operationName: String = "GetMatches"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetMatches { matches { __typename id homeTeam { __typename id name goalsScored goalsConceded } homeTeamGoals awayTeam { __typename id name goalsScored goalsConceded } awayTeamGoals startDate hasEnded } }"#
      ))

    public init() {}

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("matches", [Match?].self),
      ] }

      var matches: [Match?] { __data["matches"] }

      /// Match
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

        /// Match.HomeTeam
        ///
        /// Parent Type: `Team`
        struct HomeTeam: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BetterLeagueAPI.ID.self),
            .field("name", String.self),
            .field("goalsScored", Int.self),
            .field("goalsConceded", Int.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var name: String { __data["name"] }
          var goalsScored: Int { __data["goalsScored"] }
          var goalsConceded: Int { __data["goalsConceded"] }
        }

        /// Match.AwayTeam
        ///
        /// Parent Type: `Team`
        struct AwayTeam: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BetterLeagueAPI.ID.self),
            .field("name", String.self),
            .field("goalsScored", Int.self),
            .field("goalsConceded", Int.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var name: String { __data["name"] }
          var goalsScored: Int { __data["goalsScored"] }
          var goalsConceded: Int { __data["goalsConceded"] }
        }
      }
    }
  }

}