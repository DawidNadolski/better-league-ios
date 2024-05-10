// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class PlaceBetMutation: GraphQLMutation {
    static let operationName: String = "PlaceBet"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation PlaceBet($input: BetInput!) { placeBet(input: $input) { __typename id homeTeamGoals awayTeamGoals match { __typename id homeTeam { __typename name } awayTeam { __typename name } } better { __typename id name } } }"#
      ))

    public var input: BetInput

    public init(input: BetInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootMutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("placeBet", PlaceBet.self, arguments: ["input": .variable("input")]),
      ] }

      var placeBet: PlaceBet { __data["placeBet"] }

      /// PlaceBet
      ///
      /// Parent Type: `Bet`
      struct PlaceBet: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Bet }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("homeTeamGoals", Int.self),
          .field("awayTeamGoals", Int.self),
          .field("match", Match.self),
          .field("better", Better.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var homeTeamGoals: Int { __data["homeTeamGoals"] }
        var awayTeamGoals: Int { __data["awayTeamGoals"] }
        var match: Match { __data["match"] }
        var better: Better { __data["better"] }

        /// PlaceBet.Match
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
            .field("awayTeam", AwayTeam.self),
          ] }

          var id: BetterLeagueAPI.ID { __data["id"] }
          var homeTeam: HomeTeam { __data["homeTeam"] }
          var awayTeam: AwayTeam { __data["awayTeam"] }

          /// PlaceBet.Match.HomeTeam
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

          /// PlaceBet.Match.AwayTeam
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

        /// PlaceBet.Better
        ///
        /// Parent Type: `User`
        struct Better: BetterLeagueAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.User }
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