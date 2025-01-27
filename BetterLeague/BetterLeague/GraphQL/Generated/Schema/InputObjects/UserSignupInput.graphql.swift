// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension BetterLeagueAPI {
  struct UserSignupInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      name: String,
      password: String,
      confirmedPassword: String
    ) {
      __data = InputDict([
        "name": name,
        "password": password,
        "confirmedPassword": confirmedPassword
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

    var confirmedPassword: String {
      get { __data["confirmedPassword"] }
      set { __data["confirmedPassword"] = newValue }
    }
  }

}