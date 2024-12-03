// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class GetTeamsQuery: GraphQLQuery {
    static let operationName: String = "GetTeams"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetTeams { teams { __typename id name group } }"#
      ))

    public init() {}

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("teams", [Team].self),
      ] }

      var teams: [Team] { __data["teams"] }

      /// Team
      ///
      /// Parent Type: `Team`
      struct Team: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.Team }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("name", String.self),
          .field("group", String.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var group: String { __data["group"] }
      }
    }
  }

}