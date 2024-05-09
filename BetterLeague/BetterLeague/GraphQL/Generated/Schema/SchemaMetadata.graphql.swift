// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol BetterLeagueAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == BetterLeagueAPI.SchemaMetadata {}

protocol BetterLeagueAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == BetterLeagueAPI.SchemaMetadata {}

protocol BetterLeagueAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == BetterLeagueAPI.SchemaMetadata {}

protocol BetterLeagueAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == BetterLeagueAPI.SchemaMetadata {}

extension BetterLeagueAPI {
  typealias ID = String

  typealias SelectionSet = BetterLeagueAPI_SelectionSet

  typealias InlineFragment = BetterLeagueAPI_InlineFragment

  typealias MutableSelectionSet = BetterLeagueAPI_MutableSelectionSet

  typealias MutableInlineFragment = BetterLeagueAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "RootMutation": return BetterLeagueAPI.Objects.RootMutation
      case "User": return BetterLeagueAPI.Objects.User
      case "Bet": return BetterLeagueAPI.Objects.Bet
      case "Team": return BetterLeagueAPI.Objects.Team
      case "Match": return BetterLeagueAPI.Objects.Match
      case "RootQuery": return BetterLeagueAPI.Objects.RootQuery
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}