# frozen_string_literal: true

require "addressable/uri"
require "faraday"
require "envato/version"

module Envato
  autoload :Client, "envato/client"
  autoload :Object, "envato/object"
  autoload :Resource, "envato/resource"
  autoload :Collection, "envato/collection"
  autoload :Error, "envato/error"

  autoload :UserResource, "envato/resources/user"
  autoload :UsersResource, "envato/resources/users"
  autoload :MarketResource, "envato/resources/market"
  autoload :MarketsResource, "envato/resources/markets"
  autoload :SearchResource, "envato/resources/search"
  autoload :BookmarksResource, "envato/resources/bookmarks"
  autoload :ItemResource, "envato/resources/item"

  autoload :User, "envato/objects/types"
  autoload :UserAccount, "envato/objects/types"
  autoload :UserStatement, "envato/objects/types"
  autoload :UserList, "envato/objects/types"
  autoload :UserStatement, "envato/objects/types"
  autoload :UserCollection, "envato/objects/types"
  autoload :UserBookmark, "envato/objects/types"

  autoload :UsersTotal, "envato/objects/types"

  autoload :SearchMatch, "envato/objects/types"

  autoload :CollectionItem, "envato/objects/types"

  autoload :Item, "envato/objects/types"
  autoload :ItemPrice, "envato/objects/types"
  autoload :ItemVersion, "envato/objects/types"
end
