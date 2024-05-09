// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension BetterLeagueAPI {
  struct UserLoginInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      name: String,
      password: String
    ) {
      __data = InputDict([
        "name": name,
        "password": password
      ])
    }

    var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }
  }

}