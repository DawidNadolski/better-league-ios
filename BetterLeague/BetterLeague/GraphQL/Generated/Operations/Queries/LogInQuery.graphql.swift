// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension BetterLeagueAPI {
  class LogInQuery: GraphQLQuery {
    static let operationName: String = "LogIn"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query LogIn($input: UserLoginInput!) { logIn(input: $input) { __typename token userId } }"#
      ))

    public var input: UserLoginInput

    public init(input: UserLoginInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: BetterLeagueAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.RootQuery }
      static var __selections: [ApolloAPI.Selection] { [
        .field("logIn", LogIn.self, arguments: ["input": .variable("input")]),
      ] }

      var logIn: LogIn { __data["logIn"] }

      /// LogIn
      ///
      /// Parent Type: `AuthorizationData`
      struct LogIn: BetterLeagueAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { BetterLeagueAPI.Objects.AuthorizationData }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("token", String.self),
          .field("userId", String.self),
        ] }

        var token: String { __data["token"] }
        var userId: String { __data["userId"] }
      }
    }
  }

}