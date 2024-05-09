// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class CreateTeamMutation: GraphQLMutation {
    static let operationName: String = "CreateTeam"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CreateTeam($teamName: String!) { createTeam(teamName: $teamName) { __typename id name goalsScored goalsConceded } }"#
      ))

    public var teamName: String

    public init(teamName: String) {
      self.teamName = teamName
    }

    public var __variables: Variables? { ["teamName": teamName] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootMutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("createTeam", CreateTeam.self, arguments: ["teamName": .variable("teamName")]),
      ] }

      var createTeam: CreateTeam { __data["createTeam"] }

      /// CreateTeam
      ///
      /// Parent Type: `Team`
      struct CreateTeam: BetterLeagueAPI.SelectionSet {
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