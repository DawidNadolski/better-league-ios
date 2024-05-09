// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class CreateUserMutation: GraphQLMutation {
    static let operationName: String = "CreateUser"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CreateUser($input: UserSignupInput!) { createUser(input: $input) { __typename id name bets { __typename id homeTeamGoals awayTeamGoals } } }"#
      ))

    public var input: UserSignupInput

    public init(input: UserSignupInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootMutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("createUser", CreateUser.self, arguments: ["input": .variable("input")]),
      ] }

      var createUser: CreateUser { __data["createUser"] }

      /// CreateUser
      ///
      /// Parent Type: `User`
      struct CreateUser: BetterLeagueAPI.SelectionSet {
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

        /// CreateUser.Bet
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