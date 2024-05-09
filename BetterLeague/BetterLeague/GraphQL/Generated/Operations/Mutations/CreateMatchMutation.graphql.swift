// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class CreateMatchMutation: GraphQLMutation {
    static let operationName: String = "CreateMatch"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CreateMatch($input: MatchInput!) { createMatch(input: $input) { __typename id } }"#
      ))

    public var input: MatchInput

    public init(input: MatchInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootMutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("createMatch", CreateMatch.self, arguments: ["input": .variable("input")]),
      ] }

      var createMatch: CreateMatch { __data["createMatch"] }

      /// CreateMatch
      ///
      /// Parent Type: `Match`
      struct CreateMatch: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Match }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
      }
    }
  }

}