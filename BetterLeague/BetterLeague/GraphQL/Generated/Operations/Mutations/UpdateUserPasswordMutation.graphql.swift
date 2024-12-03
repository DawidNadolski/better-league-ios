// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class UpdateUserPasswordMutation: GraphQLMutation {
    static let operationName: String = "UpdateUserPassword"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateUserPassword($input: UserLoginInput!) { updateUserPassword(input: $input) { __typename id name password } }"#
      ))

    public var input: UserLoginInput

    public init(input: UserLoginInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootMutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("updateUserPassword", UpdateUserPassword.self, arguments: ["input": .variable("input")]),
      ] }

      var updateUserPassword: UpdateUserPassword { __data["updateUserPassword"] }

      /// UpdateUserPassword
      ///
      /// Parent Type: `User`
      struct UpdateUserPassword: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BetterLeagueAPI.ID.self),
          .field("name", String.self),
          .field("password", String?.self),
        ] }

        var id: BetterLeagueAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var password: String? { __data["password"] }
      }
    }
  }

}